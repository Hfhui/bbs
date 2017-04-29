<?php
/**
 * User: Hfhui
 * Date: 2017/2/1
 * Time: 10:12
 * Email: huangfuhui@outlook.com
 */

namespace Home\Controller;

class UserCenterController extends HomeController
{
    protected $uid = '';
    protected $data = array('res' => '0', 'info' => '');

    public function __construct()
    {
        /**
         * 判断用户是否登录
         */
        $this->uid = is_login();
        if (!$this->uid)
            $this->error('您还没有登陆', U('User/login'));

        parent::__construct();
    }

    /**
     * 个人中心首页
     */
    public function index()
    {
        $this->articles();
    }

    /**
     * 个人信息页面
     */
    public function userInfo()
    {
        // 获取用户信息
        $usr_info = D('Member')->getUsrInfo();

        $this->assign('list', $this->sidebar());
        $this->assign('usr_info', $usr_info);
        $this->assign('menu_select', '个人信息');
        $this->display();
    }

    /**
     * 修改用户密码页面
     */
    public function modifyPassword()
    {
        $this->assign('list', $this->sidebar());
        $this->assign('menu_select', '修改密码');
        $this->display();
    }

    /**
     * 修改用户密码AJAX接口
     */
    public function modifyPasswordAjax()
    {
        // 非Post请求
        if (!IS_POST) {
            $this->ajaxReturn($this->data);
            exit;
        }

        $d = D("UcenterMember");
        $data = filter_input_data(I('post.'));

        // 参数不符合
        if (empty($data['old_pwd']) || empty($data['new_pwd']) || empty($data['re_pwd'])) {
            $this->data['info'] = '表单参数不完整';
            $this->ajaxReturn($this->data);
            exit;
        }

        // 验证旧密码是否正确
        if (!$d->verifyPassword($this->uid, $data['old_pwd'])) {
            $this->data['info'] = '旧密码错误';
            $this->ajaxReturn($this->data);
            exit;
        }

        // 验证新密码是否符合要求，必须包含数字、字母和“._”字符
        if (!preg_match('/^(?![0-9]+$)(?![a-zA-Z]+$)(?![._]+$)[0-9a-zA-Z._]{6,10}$/', $data['new_pwd'])) {
            $this->data['info'] = '新密码不符合要求';
            $this->ajaxReturn($this->data);
            exit;
        }

        // 验证密码确认是否一致
        if ($data['new_pwd'] != $data['re_pwd']) {
            $this->data['info'] = '确认密码不一致';
            $this->ajaxReturn($this->data);
            exit;
        }

        // 修改用户密码
        if (!$d->modifyPassword($this->uid, $data['new_pwd'])) {
            $this->data['info'] = '修改失败，稍后重试';
            $this->ajaxReturn($this->data);
            exit;
        }

        // 修改成功
        $this->data['res'] = '1';
        $this->data['info'] = '密码修改成功';
        $this->ajaxReturn($this->data, 'json');
        exit;
    }

    /**
     * 用户发表的文章列表页面
     */
    public function articles()
    {
        // 获取跳转页码
        $page = I('get.page');
        !empty($page) && is_numeric($page) ? null : $page = 1;

        // 获取文章列表
        $data = D('Document')->myDocument($page);

        $this->assign('data', $data['list']);
        $this->assign('current_page', $data['current_page']);
        $this->assign('total_page', $data['total_page']);
        $this->assign('list', $this->sidebar());
        $this->assign('menu_select', '帖子列表');
        $this->display('articles');
    }

    /**
     * 收藏文章列表页面
     */
    public function collections()
    {
        $collections = D('collection')->getCollectionArticleList($this->uid);

        $this->assign('data', $collections);
        $this->assign('list', $this->sidebar());
        $this->assign('menu_select', '收藏列表');
        $this->display('collections');
    }

    /**
     * 获取边栏菜单列表
     * @return mixed
     */
    private function sidebar()
    {
        $parent = M("Menu")
            ->where(array('url' => array('like', 'Home/UserCenter/index')))
            ->order('sort asc,id asc')
            ->select();
        $list = M("Menu")
            ->where(array('pid' => $parent[0]['id'], 'sort' => array('lt', 5)))
            ->field('title,url')
            ->order('sort asc,id asc')
            ->select();
        return $list;
    }
}