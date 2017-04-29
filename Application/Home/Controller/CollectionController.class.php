<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/4/27
 * Time: 11:39
 */

namespace Home\Controller;

/**
 * 主要负责文章收藏功能
 * @package Home\Controller
 */
class CollectionController extends HomeController
{
    protected $result = array(
        'res' => false,
        'info' => ''
    );

    protected $uid = 0;

    public function __construct()
    {
        $this->uid = is_login();
        if (!$this->uid) {
            $this->result['info'] = '用户未登录！';
            $this->ajaxReturn($this->result);
        }

        parent::__construct();
    }

    /**
     * 收藏文章接口
     */
    public function collect()
    {
        if (!IS_POST) {
            $this->ajaxReturn($this->result);
        }

        $collect = I('post.collect');
        $article_id = I('post.article_id');
        // TODO:判断文章ID是否有效

        if ($collect) {
            // 收藏文章
            D('Collection')->collect($this->uid, $article_id);

            $this->result['res'] = true;
            $this->result['info'] = '收藏成功';
        } else {
            // 取消收藏文章
            D('Collection')->cancelCollect($this->uid, $article_id);

            $this->result['res'] = true;
            $this->result['info'] = '取消收藏成功';
        }

        $this->ajaxReturn($this->result);
    }
}