<?php
/**
 * Created by PhpStorm.
 * User: hfhui
 * Date: 2017/4/27
 * Time: 11:53
 */

namespace Home\Model;

use Think\Model;

/**
 * 文章收藏模型
 */
class CollectionModel extends Model
{
    /**
     * 收藏文章
     * @param $uid
     * @param $article_id
     */
    public function collect($uid, $article_id)
    {
        // 更新用户收藏记录
        $collect_list = $this->getCollectionList($uid);
        if (empty($collect_list)) {
            $data = array('uid' => $uid, 'article_ids' => $article_id);
            $this->add($data);
        } else {
            $data = array('article_ids' => $collect_list . ',' . $article_id);
            $this->where(array('uid' => $uid))->save($data);
        }

        // 更新文章收藏记录
        M('documentArticle')->where(array('id' => $article_id))->setInc('bookmark');
    }

    /**
     * 取消收藏文章
     * @param $uid
     * @param $article_id
     */
    public function cancelCollect($uid, $article_id)
    {
        // 更新用户收藏记录
        $collection_list = array_diff(explode(',', $this->getCollectionList($uid)), array($article_id));
        if (empty($collection_list)) {
            $data = array('article_ids' => '');
        } else {
            $data = array('article_ids' => implode(',', $collection_list));
        }
        $this->where(array('uid' => $uid))->save($data);

        // 更新文章收藏记录
        M('documentArticle')->where(array('id' => $article_id))->setDec('bookmark');
    }

    /**
     * 获取用户收藏的文章ID序列
     * @param $uid
     * @return mixed
     */
    public function getCollectionList($uid)
    {
        $map = array('uid' => $uid);
        $res = $this->where($map)->getField('article_ids');
        return $res;
    }

    /**
     * 获取用户收藏的文章列表（包含文章简介）
     * @param $uid
     * @return mixed
     */
    public function getCollectionArticleList($uid)
    {
        $collection_list = $this->getCollectionList($uid);
        $data = M('document')
            ->where(array('id' => array('in', $collection_list)))
            ->order('id desc')
            ->select();
        return $data;
    }

    /**
     * 判断用户是否有收藏某一文章
     * @param $uid
     * @param $article_id
     * @return bool
     */
    public function isCollect($uid, $article_id)
    {
        $collection_list = explode(',', $this->getCollectionList($uid));
        return in_array($article_id, $collection_list);
    }
}