<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean class="java.util.Date" id="now" scope="request" />
<jsp:directive.include file="includes/top.jsp" />
  <div class="row login_box col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2" id="loginForm" align="center">
    <form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true">
      <div class="col-md-12 col-xs-12" align="center">
              <div class="line"><h3>Central Authentication Service</h3></div>
              <!-- <div><img src="<c:url value='/images/square-logo.png'/>" class="image-circle"/></div> -->
              <div><img src="<c:url value='/images/SGS-Logo.png'/>" class="image-circle"/></div>
              <h3>Welcome</h3>
      </div>
      <div class="col-md-12 col-xs-12 follow" align="center">
              <h4 id="nowDate"></h4>
      </div>
      <div class="col-md-12 col-xs-12 login_control">
           <div class="form-group">
                <c:choose>
                  <c:when test="${not empty sessionScope.openIdLocalId}">
                    <strong>${sessionScope.openIdLocalId}</strong>
                    <input type="hidden" id="username" name="username" value="${sessionScope.openIdLocalId}" />
                  </c:when>
                  <c:otherwise>
                    <div class="col-sm-12">
                    <spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
                    <form:input cssClass="form-control" cssErrorClass="error" placeholder="Username"  id="username" tabindex="1" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true" />
                    </div>
                  </c:otherwise>
                </c:choose>
           </div>
           <div class="form-group">
                <div class="col-sm-12">
                <spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
                <form:password cssClass="form-control" cssErrorClass="error" placeholder="Password" id="password" tabindex="2" path="password"  accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off" />
                </div>
           </div>
          <%--<div class="form-group">--%>
              <%--<div class="col-sm-12" align="center" >--%>
                  <%--<select class="dropdown"  id="lang" name="lang" tabindex="3"   >--%>
                      <%--<option value="th" style="background-image: url(/cas-server/images/ess-lang-th.png);background-position: 80%; background-repeat: no-repeat; background-size: 12%;  color:#555;" >ภาษาไทย </option>--%>
                      <%--<option value="en" style="background-image: url(/cas-server/images/ess-lang-en.png);background-position: 80%; background-repeat: no-repeat; background-size: 12%; color:#555;" >English</option>--%>
                      <%--</select>--%>
              <%--</div>--%>
          <%--</div>--%>
            <div class="form-group">
                   <input type="hidden" name="lt" value="${loginTicket}" />
                    <input type="hidden" name="execution" value="${flowExecutionKey}" />
                    <input type="hidden" name="_eventId" value="submit" />
                  <div align="center">
                      <div class="submit">
                           <input class="btn btn-green" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" />" tabindex="4" type="submit" />
                          <spring:message code="button_reset" var="reset_label" htmlEscape="false" />
                           <input class="btn btn-orange" name="reset" accesskey="c" value="<spring:message code="screen.welcome.button.clear" />" tabindex="5" type="reset" />
                      </div>
                  </div>
              </div>
              <form:errors path="*" id="msg" cssClass="bg-danger text-center text-danger" element="div" htmlEscape="false" />
      </div>
    </form:form>
</div>
<jsp:directive.include file="includes/bottom.jsp" />
<script type="text/javascript">
				$("#username").css("text-transform", "lowercase");

				$("#username").keyup(function(){
						$("#username").val($("#username").val().toLowerCase());
				});

				$("#username").blur(function(){
						$("#username").val($("#username").val().toLowerCase());
				});

        // Change Language
        $('#lang-th,#lang-en').click(function() {
            commonChangeLanguage($(this).attr('alt'));
        });
        $(function(){
            $("div[id=loginForm]").slideDown({
                duration : 1200,
                complete:function(){
                  $("div[id=footerDesc]").fadeIn(1500);
                }
            });
        });
        $('#lang').change(function () {
            if($( this ).val()=="th"){
                $( this ).css("background-image","url(/cas-server/images/ess-lang-th.png)")
            }
            else {
                $( this ).css("background-image","url(/cas-server/images/ess-lang-en.png)")
            }
        });
        var urlLang = window.location.href.split("lang=")[1];
        if(urlLang=='en'){
            $('#lang').val('en');
            $('#lang').css("background-image","url(/cas-server/images/ess-lang-en.png)");
        }
        else if(urlLang=='th'){
            $('#lang').val('th');
        }
        // Config Date Month Year //
        var MonthsTH = [
                "มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน",
                "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม",
                "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
        var DaysTH = [
            "อาทิตย์","จันทร์", "อังคาร", "พุธ", "พฤหัสบดี",
                "ศุกร์", "เสาร์" ];
        var MonthsEN = [
            "January", "February", "March", "April",
            "May", "June", "July", "August",
            "September", "October", "November", "December"];
        var DaysEN = [
            "Sunday","Monday", "Tuesday", "Wednesday", "Thursday",
            "Friday", "Saturday" ];

        var date = new Date(Number("${now.time}")).getDate();
        var day = new Date(Number("${now.time}")).getDay();
        var month = new Date(Number("${now.time}")).getMonth();
        var year = new Date(Number("${now.time}")).getFullYear();
        var minutes = new Date(Number("${now.time}")).getMinutes();
        var hour = new Date(Number("${now.time}")).getHours();
        var millisecond = new Date(Number("${now.time}")).getMilliseconds();
        console.log(new Date(Number("${now.time}")).getTimezoneOffset());

        // Show Description Date //
        switch ('${lang}'){
            case 'TH':
                $("h4[id=nowDate]").text(DaysTH[day]+" "+date+" "+MonthsTH[month]+" "+(year+543));
                break;
            case 'EN':
                $("h4[id=nowDate]").text(DaysEN[day]+" "+date+" "+MonthsEN[month]+" "+year);
                break;
            default :
                $("h4[id=nowDate]").text(DaysEN[day]+" "+date+" "+MonthsEN[month]+" "+year);
                break;
        }

        function commonChangeLanguage(language) {
            var url = window.location.href;
            if (url.indexOf("lang=") >= 0) {
                var prefix = url.substring(0, url.indexOf("lang"));
                var suffix = url.substring(url.indexOf("lang")).substring(url.indexOf("=") + 1);
                suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
                url = prefix + "lang=" + language + suffix;
            } else {
                if (url.indexOf("?") < 0)
                    url += "?" + "lang=" + language;
                else
                    url += "&" + "lang=" + language;
            }
            window.location.href = url;
        }
</script>
<style>
    /* -------------------- Page Styles (not required) */


    /* -------------------- Select Box Styles: bavotasan.com Method (with special adaptations by ericrasch.com) */
    /* -------------------- Source: http://bavotasan.com/2011/style-select-box-using-only-css/ */

    /* -------------------- Rounded Corners */
    .dropdown {
        background-position: 80%;
        background-repeat: no-repeat;
        border: 1px solid #ccc;
        color: #555;
        font-size: inherit;
        margin-bottom: 15px;
        overflow: hidden;
        padding: 5px 10px;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 130px;
        background-size: 15%;
        background-image: url(/cas-server/images/ess-lang-th.png);
    }



</style>
