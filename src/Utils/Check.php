<?php


namespace App\Utils;

class Check
{
    //
    public static function isEmailLegal($email)
    {
        // return filter_var($email, FILTER_VALIDATE_EMAIL) && strlen($email) <= 32;
        $whitelist = array("qq.com", "vip.qq.com", "gmail.com", "outlook.com", "hotmail.com", "126.com", "139.com", "163.com", "sina.cn", "sina.com", "sohu.com"); #白名单
          $blocklist = array("sawoe.com", "chacuo.net", "027168.com" , "bccto.me"); #黑名单

          $json_string = file_get_contents('https://raw.githubusercontent.com/ivolo/disposable-email-domains/master/index.json');
          $block_email_list = json_decode($json_string, true);

          if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
              $Mailbox_Suffix = explode('@', $email)[1]; #获取邮箱后缀

          if(!in_array("$Mailbox_Suffix",$block_email_list)){
            return true;
              }

          } else {
              return false;
          }   
    }
}
