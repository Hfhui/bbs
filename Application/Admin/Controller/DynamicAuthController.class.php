<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/5/4
 * Time: 11:04
 */

namespace Admin\Controller;

use Admin\Model\AuthRuleModel;

class DynamicAuthController extends AdminController
{
    /**
     * 动态权限首页
     */
    public function index()
    {
        $list = D('DynamicAuth')->lists();

        $this->assign('_list', $list);
        $this->meta_title = '动态权限';
        $this->display();
    }

    /**
     * 申请权限页面操作
     */
    public function add()
    {
        if (IS_POST) {
            $data = I('post.');
            $auth_ids = implode(',', $data['rules']);
            D('DynamicAuth')->applyAuth(is_login(), $auth_ids, $data['apply_valid_date'], $data['apply_reason']);

            $this->success('操作成功!', U('index'));
        } else {
            $this->updateRules();
            $node_list = $this->returnNodes();
            $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_MAIN, 'status' => 1);
            $main_rules = M('AuthRule')->where($map)->getField('name,id');
            $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_URL, 'status' => 1);
            $child_rules = M('AuthRule')->where($map)->getField('name,id');

            $this->assign('main_rules', $main_rules);
            $this->assign('auth_rules', $child_rules);
            $this->assign('node_list', $node_list);
            $this->meta_title = '申请权限';
            $this->display();
        }
    }

    /**
     * 后台节点配置的url作为规则存入auth_rule
     * 执行新节点的插入,已有节点的更新,无效规则的删除三项任务
     */
    public function updateRules()
    {
        //需要新增的节点必然位于$nodes
        $nodes = $this->returnNodes(false);

        $AuthRule = M('AuthRule');
        $map = array('module' => 'admin', 'type' => array('in', '1,2'));//status全部取出,以进行更新
        //需要更新和删除的节点必然位于$rules
        $rules = $AuthRule->where($map)->order('name')->select();

        //构建insert数据
        $data = array();//保存需要插入和更新的新节点
        foreach ($nodes as $value) {
            $temp['name'] = $value['url'];
            $temp['title'] = $value['title'];
            $temp['module'] = 'admin';
            if ($value['pid'] > 0) {
                $temp['type'] = AuthRuleModel::RULE_URL;
            } else {
                $temp['type'] = AuthRuleModel::RULE_MAIN;
            }
            $temp['status'] = 1;
            $data[strtolower($temp['name'] . $temp['module'] . $temp['type'])] = $temp;//去除重复项
        }

        $update = array();//保存需要更新的节点
        $ids = array();//保存需要删除的节点的id
        foreach ($rules as $index => $rule) {
            $key = strtolower($rule['name'] . $rule['module'] . $rule['type']);
            if (isset($data[$key])) {//如果数据库中的规则与配置的节点匹配,说明是需要更新的节点
                $data[$key]['id'] = $rule['id'];//为需要更新的节点补充id值
                $update[] = $data[$key];
                unset($data[$key]);
                unset($rules[$index]);
                unset($rule['condition']);
                $diff[$rule['id']] = $rule;
            } elseif ($rule['status'] == 1) {
                $ids[] = $rule['id'];
            }
        }
        if (count($update)) {
            foreach ($update as $k => $row) {
                if ($row != $diff[$row['id']]) {
                    $AuthRule->where(array('id' => $row['id']))->save($row);
                }
            }
        }
        if (count($ids)) {
            $AuthRule->where(array('id' => array('IN', implode(',', $ids))))->save(array('status' => -1));
            //删除规则是否需要从每个用户组的访问授权表中移除该规则?
        }
        if (count($data)) {
            $AuthRule->addAll(array_values($data));
        }
        if ($AuthRule->getDbError()) {
            trace('[' . __METHOD__ . ']:' . $AuthRule->getDbError());
            return false;
        } else {
            return true;
        }
    }

    /**
     * 申请详情页
     */
    public function detail()
    {
        $data = D('DynamicAuth')->detail(I('get.id'));

        $this->updateRules();
        $node_list = $this->returnNodes();
        $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_MAIN, 'status' => 1);
        $main_rules = M('AuthRule')->where($map)->getField('name,id');
        $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_URL, 'status' => 1);
        $child_rules = M('AuthRule')->where($map)->getField('name,id');

        $this->meta_title = '申请权限';
        $this->assign('main_rules', $main_rules);
        $this->assign('auth_rules', $child_rules);
        $this->assign('node_list', $node_list);
        $this->assign('data', $data);
        $this->display();
    }

    /**
     * 处理权限申请
     */
    public function dealApplication()
    {
        $id = I('post.id');
        if (empty($id)) {
            $this->error('缺少参数！');
        }

        if (D('DynamicAuth')->agreeApplication($id)) {
            $this->success('操作成功！', U('DynamicAuth/index'));
        } else {
            $this->error('未知错误！');
        }
    }

    /**
     * 回收权限
     */
    public function recycle()
    {
        $ids = I('post.id');
        if (empty($ids)) {
            $this->error('请选择要操作的数据！');
        }

        // 回收权限
        D('DynamicAuth')->recycle($ids);
        $this->success('操作成功！', U('DynamicAuth/index'));
    }
}