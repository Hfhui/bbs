<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/5/18
 * Time: 21:33
 */

namespace Admin\Model;

use Think\Model;

class AuthTransferModel extends Model
{
    /**
     * 获取转移记录
     * @return mixed
     */
    public function lists()
    {
        $list = $this->order('id desc')->select();
        foreach ($list as &$v) {
            $v['operator'] = get_nickname($v['operator']);
            $v['inheritor'] = get_nickname($v['inheritor']);
            $v['build_time'] = date('Y-m-d H:i:s', $v['build_time']);
        }
        return $list;
    }

    /**
     * 获取用户可转移的动态权限列表
     * @return mixed
     */
    public function transferList()
    {
        $data = M('DynamicAuth')
            ->where(array('valid' => 1, 'performer' => is_login()))
            ->order('id desc')
            ->select();
        foreach ($data as &$v) {
            $v['applicant'] = get_nickname($v['uid']);
            $v['performer'] = get_nickname($v['performer']);
            $v['valid_time'] = date('Y-m-d H:i:s', $v['deal_time'] + $this->renderApplyValidDate($v['apply_valid_date']));
        }
        return $data;
    }

    /**
     * 转移权限，记录日志
     * @param $auth_id
     * @param $inheritor
     */
    public function transferAuth($auth_id, $inheritor)
    {
        // 修改权限执行者
        M('DynamicAuth')->where(array('id' => $auth_id))->save(array('performer' => $inheritor));

        // 求权限剩余生效时间
        $res = M('DynamicAuth')->where(array('id' => $auth_id))->field('deal_time,apply_valid_date')->find();
        $valid_time = ($res['deal_time'] + $this->renderApplyValidDate($res['apply_valid_date'])) - time();

        // 增加权限修改日志
        $this->add(array(
            'auth_id' => $auth_id,
            'operator' => is_login(),
            'inheritor' => $inheritor,
            'build_time' => time(),
            'valid_time' => $valid_time
        ));
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