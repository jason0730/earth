<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
    <title>提交订单</title>
<meta name="handheldfriendly" content="true"/>
<meta name="application-name" content="好大夫在线"/>
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-title" content="提交订单">
<link rel="apple-touch-icon-precomposed" href="http://i1.hdfimg.com/touch/images/icon_touch.png" />
<link href="http://i1.hdfimg.com/touch/css/base_t.8d7f622c.css" rel="stylesheet" type="text/css">
<link href="http://i1.hdfimg.com/touch/css/touch.6bcff805.css" rel="stylesheet" type="text/css">
<script src="http://i1.hdfimg.com/js/jquery-1.4.2.min.js?20140409" type="text/javascript"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" type="text/javascript"></script>
<script src="http://i1.hdfimg.com/touch/js/touch.80c31ab7.js" type="text/javascript"></script>
<style type="text/css">
<!--
html {_background-image: url(about:blank);_background-attachment: fixed;/* 确保ie6滚动不闪烁 */}
-->
</style>
<script type="text/javascript">
var canUpload = "";
</script>
</head>
<body>
<div class="head_p">
    <p class="head_c fl f19">提交订单</p>
</div>
<script type="text/javascript" src="http://i1.hdfimg.com/my/js/jquery.framework.min.js?201107151"></script>
<div class="checkout_box">
    <div class="flow_box">
        <div class="full_line_bg"></div>
        <div class="dotted_line_bg"></div>
        <ul>
            <li>
                <i class="icon_suborder on"></i>
                <span>提交订单</span>
            </li>
            <li>
                <i class="icon_pay"></i>
                <span>付款</span>
            </li>
            <li>
                <i class="icon_doctime"></i>
                <span>约医生时间</span>
            </li>
            <li>
                <i class="icon_doctell"></i>
                <span>与医生通话</span>
            </li>
        </ul>
        <div class="top_tips">90%当天与医生本人通话</div>
    </div>
    <form name="apply" method="post" action="post.php" accept-charset="GBK" id="telOrderForm">
        <div class="entering_info">
            <div class="item_box">
                <div class="title">
                    <span class="tit">患者信息：</span><span class="important">*</span>
                </div>
                <div class="input_box">
                <a href="http://m.haodf.com/touch/tel/selectpatient"><span id="patientname">填写患者信息</span></a>
                </div>
                <div class="title">
                    <span class="tit">手机号：</span><span class="important">*</span>
                </div>
                <div class="input_box" style="background:none;">
                    <input type="tel" name="mobile" id="mobile" value="" />
                </div>
                <div class="tips">请准确填写，用于医生与您通话使用</div>
                <div class="title">
                    <span class="tit">所患疾病：</span><span class="important">*</span>                </div>
                <div class="input_box">
                    <textarea name="disease" id="diseaseName" class="textarea1" onpropertychange="changeHeight(this,'42px');" oninput="inputHeight(this, '42px');"></textarea>
                </div>
                <div class="title">
                    <span class="tit">病情描述：</span><span class="important">*</span>                </div>
                <div class="input_box">
                    <textarea name="desc" id="diseaseDesc" class="textarea2" onpropertychange="changeHeight(this,'75px');" oninput="inputHeight(this, '75px');"></textarea>
                </div>
                <div class="tips">请填写简要病情、咨询目的、就诊情况等，以便大夫能及时了解，可调高通话效率。</div>
                <div class="check_rules"><i class="icon_check on" id="serviceTerm"></i>同意<a href="/touch/tel/publishterm">服务条款</a></div>
                <input type="hidden" value="3673" name="productId" />
                <input type="hidden" value="" name="watchconditiondesc" id="watchconditiondesc"/>
                <input type="hidden" value="" name="watchdiseasename" id="watchdiseasename"/>
                <input type="hidden" value="" name="watchform" id="watchform"/>
                <a class="btn_ok" id="next_watch" href="javascript:;" >下一步</a>
        </div>
    </form>   
</div>
    
<script src="http://i1.hdfimg.com/touch/js/newcase.5966e70a.js" type="text/javascript"></script>

<div style="display:none;">
<script type="text/javascript" src="http://i1.hdfimg.com/js/pvstat.js?20140322"></script>
<script src="http://s6.cnzz.com/stat.php?id=5285151&web_id=5285151" language="JavaScript"></script>
</div>
</body>
</html>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48523183-1', 'haodf.com');
  ga('send', 'pageview');

</script>

<script type="text/javascript">
    function changeHeight(obj,h)
    {
        obj.style.height=h;
        obj.style.height=obj.scrollHeight + 'px';   
    }
    function inputHeight(obj,h)
    {
        obj.style.height=h;
        obj.style.height=obj.scrollHeight + 'px';
    }
    $(".icon_check").click(function(){
        $(this).toggleClass("on")
    })
    //$("#mobile").blur(function(){
    //    $.post("/touch/tel/savemobile", {'mobile':$(this).val()});
    //});
    //$("#diseaseName").blur(function(){
    //    $.post("/touch/tel/savediseasename", {'diseasename':$(this).val()});
    //});
    //$("#diseaseDesc").blur(function(){
    //    $.post("/touch/tel/saveconditiondesc", {'desc':$(this).val()});
    //});
    $("#next_watch").click(function(){
        var desc = $("#diseaseDesc").val();
        var disease = $("#diseaseName").val();
        var form = $('#telOrderForm').serialize();
        $('#watchconditiondesc').val(desc);
        $('#watchdiseasename').val(disease);
        $('#watchform').val(form);
        $.cookie('conditiondesc', desc);
        $.cookie('diseaseName', disease);
        $.cookie('watchform', form);
        $("#telOrderForm").submit();
        //checkTelOrderForm();
    })
</script>
