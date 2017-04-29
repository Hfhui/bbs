<?php
/**
 * User: Hfhui
 * Date: 2017/2/14
 * Time: 1:15
 * Email: huangfuhui@outlook.com
 */
namespace Home\Model;

use Think\Model;

/**
 * 用户中心信息模型
 * @package Home\Model
 */
class UcenterMemberModel extends Model
{
    /**
     * 验证用户密码是否正确
     * @param $uid
     * @param $password
     * @return bool
     */
    public function verifyPassword($uid, $password)
    {
        $key = C('DATA_AUTH_KEY');
        $password_str = $this->where(array('id' => $uid))->getField('password');
        return $password_str == md5(sha1($password) . $key);
    }

    /**
     * 修改用户密码
     * @param $uid
     * @param $password
     * @return bool
     */
    public function modifyPassword($uid, $password)
    {
        return $this->where(array('id' => $uid))
            ->save(array('password' => md5(shal($password) . C('DATA_AUTH_KEY'))));
    }

}