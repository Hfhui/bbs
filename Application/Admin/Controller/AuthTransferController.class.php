<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/5/18
 * Time: 20:03
 */

namespace Admin\Controller;

use Admin\Model\AuthRuleModel;

class AuthTransferController extends AdminController
{
    /**
     * 转移记录页
     */
    public function index()
    {
        $list = D('AuthTransfer')->lists();

        $this->assign('list', $list);
        $this->display('index');
    }

    /**
     * 可转移权限列表页
     */
    public function transfer()
    {
        $list = D('AuthTransfer')->transferList();

        $this->assign('list', $list);
        $this->display('transfer');
    }

    /**
     * 转移权限的详情页面
     */
    public function detail()
    {
        $data = D('DynamicAuth')->detail(I('get.id'));

        $node_list = $this->returnNodes();
        $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_MAIN, 'status' => 1);
        $main_rules = M('AuthRule')->where($map)->getField('name,id');
        $map = array('module' => 'admin', 'type' => AuthRuleModel::RULE_URL, 'status' => 1);
        $child_rules = M('AuthRule')->where($map)->getField('name,id');

        $this->meta_title = '申请详情';
        $this->assign('main_rules', $main_rules);
        $this->assign('auth_rules', $child_rules);
        $this->assign('node_list', $node_list);
        $this->assign('data', $data);
        $this->display('detail');
    }

    /**
     * 转移权限
     */
    public function transferAuth()
    {
        $auth_id = I('post.auth_id');
        $inheritor = I('post.inheritor');
        if (empty($inheritor) || !get_nickname($inheritor) || get_nickname($inheritor) == is_login()) {
            $this->error('未知转移对象！');
        } elseif (empty($auth_id)) {
            $this->error('未选择转移权限！');
        }

        $group_id = M('AuthGroup')->where(array('title' => '管理员'))->getField('id');
        $res = M('AuthGroupAccess')->where(array('uid' => $inheritor, 'group_id' => $group_id))->select();
        if (empty($res)) {
            $this->error('转移对象非管理员用户！');
        }

        // 判断该权限是否属于用户
        if (!D('DynamicAuth')->authIsForUser($auth_id, is_login())) {
            $this->error('无效权限！');
        }

        // 转移权限并记录操作日志
        D('AuthTransfer')->transferAuth($auth_id, $inheritor);
        $this->success('权限转移成功！', 'Admin/AuthTransfer/index');
    }
}