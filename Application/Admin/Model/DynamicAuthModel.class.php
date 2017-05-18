<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/5/4
 * Time: 21:44
 */

namespace Admin\Model;

use Think\Model;

class DynamicAuthModel extends model
{
    /**
     * 申请权限
     * @param $uid
     * @param $auth_ids
     * @param $apply_valid_date
     * @param $application_reason
     */
    public function applyAuth($uid, $auth_ids, $apply_valid_date, $application_reason)
    {
        $data = array(
            'uid' => $uid,
            'apply_auth' => $auth_ids,
            'apply_valid_date' => $apply_valid_date,
            'application_reason' => $application_reason,
            'application_date' => time(),
            'status' => 'a'
        );
        $this->add($data);
    }

    /**
     * 获取权限申请列表
     * @return mixed
     */
    public function lists()
    {
        // TODO:分页处理

        $res = $this->order('id desc')->select();
        $count = count($res);
        for ($i = 0; $i < $count; $i++) {
            $res[$i]['nickname'] = get_nickname($res[$i]['uid']);
            $this->renderData($res[$i]['application_date'], $res[$i]['apply_valid_date'], $res[$i]['deal_time'], $res[$i]['status'], $res[$i]['valid']);
        }
        return $res;
    }

    /**
     * 获取某条申请详情
     * @param $id
     * @return mixed
     */
    public function detail($id)
    {
        $res = $this->where(array('id' => $id))->find();
        $res['nickname'] = get_nickname($res['uid']);
        $res['apply_valid_date_string'] = $res['apply_valid_date'];
        $this->renderData($res['application_date'], $res['apply_valid_date_string'], $res['deal_time'], $res['status'], $res['valid']);
        $res['apply_auth_name'] = $this->renderAuth($res['apply_auth']);

        return $res;
    }

    /**
     * 同意申请
     * @param $id
     * @return bool
     */
    public function agreeApplication($id)
    {
        // TODO:判断ID合法性

        $data['deal_time'] = time();
        $data['status'] = 'b';
        $data['valid'] = '1';
        // 更新[dynamic_auth]表数据
        $res = $this->where(array('id' => $id))->save($data);
        if (!$res) {
            return false;
        }

        return true;
    }


    /**
     * 回收尚生效的临时权限
     * @param $ids 权限记录ID序列
     */
    public function recycle($ids)
    {
        $data = $this->where(array('id' => array('in', implode(',', $ids))))->select();
        foreach ($data as $v) {
            if (($this->renderApplyValidDate($v['apply_valid_date']) + $v['deal_time'] > time()) && $v['valid'] == '1') {
                $this->where(array('id' => $v['id']))->save(array('valid' => 0));
            }
        }
    }

    /**
     * 获取用户申请成功并且有效的权限序列
     * @param $uid
     * @return string
     */
    public function getDynamicAuthForUser($uid)
    {
        $res = $this->where(array('uid' => $uid, 'valid' => '1'))
            ->field('id,apply_auth,apply_valid_date,deal_time')
            ->select();

        if (empty($res)) {
            return '';
        }

        $count = count($res);
        for ($i = 0; $i < $count; $i++) {
            if (($this->renderApplyValidDate($res[$i]['apply_valid_date']) + $res[$i]['deal_time']) < time()) {
                $this->where(array('id' => $res[$i]['id']))->save(array('valid' => '0'));
            }
        }
        $res = $this->where(array('uid' => $uid, 'valid' => '1'))->field('apply_auth')->select();
        $auth_list = '';
        foreach ($res as $k) {
            $auth_list .= $k['apply_auth'] . ',';
        }
        $auth_list = implode(',', array_unique(explode(',', $auth_list)));

        return $auth_list;
    }

    /**
     * 获取用户申请成功并且有效的URL
     * @param $uid
     * @return mixed
     */
    public function getDynamicAuthUrlsForUsr($uid)
    {
        $auth_list = $this->getDynamicAuthForUser($uid);

        if (empty($auth_list)) {
            return [];
        }

        $auth_url = M('auth_rule')->where(array('id' => array('in', $auth_list)))->field('name')->select();
        $res = array();
        $count = count($auth_url);
        for ($i = 0; $i < $count; $i++) {
            $res[$i] = strtolower($auth_url[$i]['name']);
        }

        return $res;
    }

    /**
     * 渲染数据
     * @param $application_date 申请的时间
     * @param $apply_valid_date 申请权限使用期
     * @param $deal_time 申请处理时间
     * @param $status 申请状态
     * @param $valid 申请的权限是否有效
     */
    protected function renderData(&$application_date, &$apply_valid_date, &$deal_time, &$status, &$valid)
    {
        $application_date = time_format($application_date);
        switch ($apply_valid_date) {
            case 1: {
                $apply_valid_date = '一个小时';
            }
                break;
            case 2: {
                $apply_valid_date = '三个小时';
            }
                break;
            case 3: {
                $apply_valid_date = '十二小时';
            }
                break;
            case 4: {
                $apply_valid_date = '二十四小时';
            }
                break;
        }
        empty($deal_time) ? $deal_time = '等待处理' : $deal_time = time_format($deal_time);
        switch ($status) {
            case 'a' : {
                $status = '待审';
            }
                break;
            case 'b' : {
                $status = '同意';
            }
                break;
            case 'c' : {
                $status = '拒绝';
            }
                break;
        }
        empty($valid) ? $valid = '无效' : $valid = '有效';
    }

    /**
     * 渲染申请的权限
     * @param $auth_ids
     * @return string
     */
    protected function renderAuth($auth_ids)
    {
        $res = M('AuthRule')->where(array('id' => array('in', $auth_ids)))->field('title')->select();
        $str = '';
        foreach ($res as $k) {
            $str .= $k['title'] . ' ';
        }
        return $str;
    }

    /**
     * 计算申请权限生效的时间
     * @param $apply_valid_date
     * @return int 返回 UNIX 时间戳
     */
    protected function renderApplyValidDate($apply_valid_date)
    {
        $time = 0;
        switch ($apply_valid_date) {
            case 1: {
                $time = 1 * 3600;
            }
                break;
            case 2: {
                $time = 3 * 3600;
            }
                break;
            case 3: {
                $time = 12 * 3600;
            }
                break;
            case 4: {
                $time = 24 * 3600;
            }
                break;
        }

        return $time;
    }
}