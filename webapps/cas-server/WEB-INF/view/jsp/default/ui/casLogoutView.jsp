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
<jsp:directive.include file="includes/top.jsp" />
    <div class="row login_box  col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2" id="loginForm" align="center">
      <div class="col-md-12 col-xs-12 text-center" align="center">
            <h2><spring:message code="screen.logout.header" /></h2>
            <p><spring:message code="screen.logout.success" /></p>
            <p><spring:message code="screen.logout.security" /></p>
      </div>
      <div class="col-md-12 col-xs-12 follow" align="center"> </div>
    </div>
<jsp:directive.include file="includes/bottom.jsp" />
<script type="text/javascript">
      $(function(){
             $("div[id=loginForm]").slideDown({
                duration : 1200,
                complete:function(){
                  $("div[id=footerDesc]").fadeIn(1500);
                }
            });
       });
</script>