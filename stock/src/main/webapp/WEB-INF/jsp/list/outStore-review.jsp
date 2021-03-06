<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jspf" %>
<ys:contentHeader/>
<style type="text/css">
    .input-text {
        width: 205px;
    }

    label.form-label.col-xs-4.col-sm-3 {
        width: 200px;
        font-size: 15px;
        font-family: inherit;
    }

    label.form-label.col-xs-4.col-sm-3.goods {
        width: 200px;

    }

    #one {
        margin-left: 105px;
        width: 650px;
    }

    div.formControls.col-xs-8.col-sm-4 {
        width: 150px;
    }

    div.formControls.col-xs-8.col-sm-4.good {
        width: 100px;
    }

    form#form-user-add.form.form-horizontal {
        width: 800px;
    }

    div#review.row.cl {
        width: 300px;
        margin-left: 18px;
    }

    body {
        width: 1200px;
        heght: 550px;
    }
</style>
<body>
<article class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-user-add">
        <input type="hidden" name="id" value="${outStore.id}" id="num">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>出库单号:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text" class="input-text" value="${outStore.id}" id="pnum" name="id">
            </div>
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>派单时间:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text" class="input-text"
                       value="<fmt:formatDate value="${outStore.addTime}" pattern="yyyy-MM-dd hh:mm:ss"/>" id="ptime"
                       name="deliveryTime">
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>配货单号:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text" class="input-text" value="${outStore.deliveryId}" id="actor"
                       name="purchaseId">
            </div>
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>仓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp库:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text" class="input-text" id="shopname" value="${outStore.storeName}"
                       name="outStoreId">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>类&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp型:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <c:if test="${outStore.type == 1}"><input type="text" class="input-text" value="正常出库单"
                                                          name="status"></c:if>
                <c:if test="${outStore.type == 2}"><input type="text" class="input-text" value="报废单"
                                                          name="status"></c:if>
            </div>
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>状&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp态:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <c:if test="${outStore.status == 1}"><input type="text" class="input-text" value="审核中"
                                                            name="status"></c:if>
                <c:if test="${outStore.status == 2}"><input type="text" class="input-text" value="已完成"
                                                            name="status"></c:if>
               
            </div>

        </div>
        <div id="bei" class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>备&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp注:</label>
            <div class="formControls col-xs-8 col-sm-4">
                <input type="text" class="input-text" value="${outStore.remark}" id="remark" name="remark">
            </div>

        </div>
        <div id="one" class="mt-20">
            <table class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th width="5%">序号</th>
                    <th width="8%">商品名称</th>
                    <th width="8%">条码</th>
                    <th width="5%">现有库存</th>
                    <th width="5%">配货量</th>
                    <th width="5%">单位</th>
                    <th width="10%">备注</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderlist}" var="order">
                    <tr class="text-c">
                        <th>${order.no}</th>
                        <th>${order.productName}</th>
                        <th>${order.barCode}</th>
                        <th>${order.stock}</th>
                        <th>${order.number}</th>
                        <th>${order.unit}</th>
                        <th>${order.remark}</th>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3 goods"><span class="c-red"></span>商品总数:</label>
            <div class="formControls col-xs-8 col-sm-4 good">
                <input type="text" class="input-text" value="${count.totalProduct}" id="supname" name="name">
            </div>
            <label id="shu" class="form-label col-xs-4 col-sm-3 goods"><span class="c-red"></span>总件数:</label>
            <div class="formControls col-xs-8 col-sm-4 good">
                <input type="text" class="input-text" value="${count.totalNum}" id="address"
                       name="address">
            </div>
        </div>

       
        <shiro:hasAnyRoles name="管理员,库存主管">
            <div id="review" class="row cl">
                <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                    <input class="btn btn-primary radius" type="button" id="accept" onclick="haveAccept()"
                           value="&nbsp;&nbsp;通过&nbsp;&nbsp;">
                    <!--   <input class="btn btn-primary radius" type="button" id="refuse" value="&nbsp;&nbsp;拒绝&nbsp;&nbsp;"> -->
                </div>
            </div>
        </shiro:hasAnyRoles>
    </form>
</article>


<script type="text/javascript">
   $(function(){
	   var status=${outStore.status};
	   if(status==2){
		   $("#review").css("display","none");
	   }else{
		   $("#review").css("display","block");
	   }
   });


    function haveAccept() {
        var ooid = $("#num").val();
        var ddid = $("#actor").val();
        $.ajax({
            url: "${context_root}/list/outStoreCheck.action?ooid=" + ooid + "&ddid=" + ddid,
            type: 'post',
            async: true,
            cache: false,
            dataType: "json",
            success: function (data) {
                if (data.s == true) {
                    parent.layer.msg('审核通过!', {icon: 6, time: 1000});
                    setTimeout('window.parent.location.reload()',1200);    
                } else {
                    parent.layer.alert(data.m, {icon: 2, title: "系统提示"});
                }
            },
        });
    }

    function formatDateStr(dateStr, a) {
        var d = new Date(date);
        a.val(d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate());
    }
    
    var st="${outStore.addTime}";
    var sd=st.substring(11,13);
    //alert(sd);
     var tt=$("#ptime").val();
     var td=tt.substring(0,11)+" "+sd+tt.substring(13);
    $("#ptime").val(td);
 
</script>
</body>
</html> 