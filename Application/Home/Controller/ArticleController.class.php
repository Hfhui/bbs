<?php
/**
 * User: Hfhui
 * Date: 2017/2/18
 * Time: 10:12
 * Email: huangfuhui@outlook.com
 */
namespace Home\Controller;

/**
 * 用户文章控制器
 * 用于前台用户文章的增删查改
 */
class ArticleController extends HomeController
{

    /**
     * 文档模型频道页
     */
    public function index()
    {
        /* 分类信息 */
        $category = $this->category();

        //频道页只显示模板，默认不读取任何内容
        //内容可以通过模板标签自行定制

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->display($category['template_index']);
    }

    /*
     * 文档模型列表页
     */
    public function lists($p = 1)
    {
        /* 分类信息 */
        $category = $this->category();

        /* 获取当前分类列表 */
        $Document = D('Document');
        $list = $Document->page($p, $category['list_row'])->lists($category['id']);
        if (false === $list) {
            $this->error('获取列表数据失败！');
        }

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->assign('list', $list);
        $this->display($category['template_lists']);
    }

    /*
     * 文档模型详情页
     */
    public function detail($id = 0, $p = 1)
    {
        /* 标识正确性检测 */
        if (!($id && is_numeric($id))) {
            $this->error('文档ID错误！');
        }

        /* 页码检测 */
        $p = intval($p);
        $p = empty($p) ? 1 : $p;

        /* 获取详细信息 */
        $Document = D('Document');
        $info = $Document->detail($id);
        if (!$info) {
            $this->error($Document->getError());
        }

        /* 分类信息 */
        $category = $this->category($info['category_id']);

        /* 获取模板 */
        if (!empty($info['template'])) {//已定制模板
            $tmpl = $info['template'];
        } elseif (!empty($category['template_detail'])) { //分类已定制模板
            $tmpl = $category['template_detail'];
        } else { //使用默认模板
            $tmpl = 'Article/' . get_document_model($info['model_id'], 'name') . '/detail';
        }

        /* 更新浏览数 */
        $map = array('id' => $id);
        $Document->where($map)->setInc('view');

        // 判断用户是否有收藏该文章
        $uid = is_login();
        if ($uid) {
            $collect = D('Collection')->isCollect($uid, $info['id']);
        } else {
            $collect = false;
        }

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->assign('info', $info);
        $this->assign('collect', $collect);
        $this->assign('page', $p); //页码
        $this->display($tmpl);
    }

    /**
     * 文档分类检测
     * @param int $id
     * @return mixed
     */
    private function category($id = 0)
    {
        /* 标识正确性检测 */
        $id = $id ? $id : I('get.category', 0);
        if (empty($id)) {
            $this->error('没有指定文档分类！');
        }

        /* 获取分类信息 */
        $category = D('Category')->info($id);
        if ($category && 1 == $category['status']) {
            switch ($category['display']) {
                case 0:
                    $this->error('该分类禁止显示！');
                    break;
                default:
                    return $category;
            }
        } else {
            $this->error('分类不存在或被禁用！');
        }
    }

    /**
     * 发表文章
     */
    public function publish()
    {
        // 提醒未登录用户登录
        if (!is_login()) {
            redirect('index.php?s=Home/User/login', 1, '先登录，再挥笔！');
        }

        if (IS_POST) {
            /**
             * 添加部分默认字段值
             */
            $_POST['name'] = '';    // 标识
            $_POST['type'] = '2';   // 内容类型
            $_POST['pid'] = '0';    // 所属父分类id
            $_POST['model_id'] = '2';   // 内容模型id（此处默认为“文章”）

            empty(I('post.title')) && $this->error("帖子标题呢？");
            empty(I('description')) && $this->error("写点描述呗...");

            // 发表帖子
            $document = D('Document');
            $res = $document->update();
            if (!$res) {
                $this->error($document->getError());
            }
            $this->success('发表成功', 'Home/Index');
        } else {
            // 获取帖子分类
            $category_type = M('category')->where(array('pid' => 1))->field('id,title')->select();

            $this->assign('category_type', $category_type);
            $this->display('publish');
        }
    }
}
