/**
 * Created by SKX on 2017/8/21.
 */
$(function(){


    //预警信息隐藏
    $(".yjmsg_tit").click(function(){
        $(".yj_pos").show();
    });
    $(".yj_close").click(function(){
        $(".yj_pos").hide();
    });
    //一级菜单
    $(".hd .hd_nav li").click(function(){
        $(this).addClass("active_new").siblings().removeClass('active_new');
    });

    //查询块tab插件
       $.fn.createTab = function (opt) {
       var def = {
            activeEvt: 'click',
            activeCls: 'cur'
        }
        $.extend(def, opt);
        this.each(function () {
            var $this = $(this);
            $this.find('.chaxun_tab li').click(def.activeEvt,function(){
                var index = $(this).index(),
                    that = $(this);
                that.addClass('active').siblings().removeClass('active');
                $this.find('.cx_cont').eq(index).addClass('active').siblings().removeClass('active');
            })
        });
    }
    $(".search_tab").createTab();


    //滚动条
   $(document).ready(function(){
        $(".tb").niceScroll({
            touchbehavior:false,
            railoffset:false,
            railpadding: { top: "0", right:"0", left:"0", bottom: "0" },
            cursorcolor:"#dee1e2",
            cursoropacitymax:0.7,
            cursorwidth:5,
            background:"#ccc",
            cursorborderradius: "5px",//以像素为光标边界半径
            autohidemode:"leave"
            //railpadding:(5,0,5)
        });
    });
    //工具收缩
    var isClosed=true;
    $(".tool_shirk").click(function(){
        hamburger_cross($(".tool_box"));
    });
    function hamburger_cross(overlay) {
        if (isClosed == true) {
            overlay.animate({
                "right":"-160px"
            },200);
            $(".tool_box").css("border","none");
            $(".tool_shirk .bg").addClass("bga").css("width","25px").html("");
            isClosed = false;
        } else {
            overlay.animate({
                "right":"0"
            },200);
            $(".tool_box").css("borderBottom","1px solid #ccc");
            $(".tool_shirk .bg").removeClass("bga").css("width","30px").html("工具");
            isClosed = true;
        }
    }
    //图例
    var falge = true;
    $(".caption").click(function(){
        if (falge == true) {
            $(".legend_pos").animate({
                "bottom":"0"
            },600);
            falge = false;
        } else {
            $(".legend_pos").animate({
                "bottom":"-148px"
            },500);
            falge = true;
        }
    });


    //地图收缩
/*    var timer=null;
    $(".map_tab ul").mouseenter(function(){
        clearTimeout(timer);
        $(".map_tab ul li:nth-child(2)").animate({"left":"90px"});
        $(".map_tab ul li:nth-child(3)").animate({"left":"0"});
        $(".map_tab").css("width","0");
    });
    $(".map_tab ul").mouseleave(function(){
        timer=setTimeout(function(){
            $(".map_tab ul li:nth-child(2)").animate({"left": "176px"});
            $(".map_tab ul li:nth-child(3)").animate({"left": "172px"});
        },500)

    });
*/



})