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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="row col-md-6 col-md-offset-3 col-lg-4 col-lg-offset-4 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2" id="footerDesc" align="center">
        <div class="col-md-12 col-xs-12" align="center">
            <p>
              <img src="<c:url value='/images/softplus-logo.jpg'/>" class="image-circle-footer"/>
              <img src="<c:url value='/images/ss-logo.gif'/>" class="image-circle-footer"/>
              <img src="<c:url value='/images/Spring-logo.png'/>" class="image-circle-footer"/>
              <img src="<c:url value='/images/hibernate-logo.png'/>" class="image-circle-footer"/>
              <img src="<c:url value='/images/bootstrap-logo.png'/>" class="image-circle-footer"/>
              <img src="<c:url value='/images/jquery-logo.png'/>" class="image-circle-footer"/>
            </p>    
            <p><spring:message code="copyright" /></p>
            <p>
              Powered by <a href="http://www.jasig.org/cas">Jasig Central Authentication Service <%=org.jasig.cas.CasVersion.getVersion()%></a>
            </p>
        </div>
    </div>
    </div> <!-- END #container -->
    
   <%--  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    
   
       JavaScript Debug: A simple wrapper for console.log 
        See this link for more info: http://benalman.com/projects/javascript-debug-console-log/
   
    <script type="text/javascript" src="https://github.com/cowboy/javascript-debug/raw/master/ba-debug.min.js"></script> --%>
    
    <spring:theme code="cas.javascript.file" var="casJavascriptFile" text="" />
    <spring:theme code="bootstrap.javascript.file" var="bootstrapJavascriptFile" text="" />
    <spring:theme code="jquery.javascript.file" var="jqueryJavascriptFile" text="" />
    <script type="text/javascript" src="<c:url value="${jqueryJavascriptFile}" />"></script>
    <script type="text/javascript" src="<c:url value="${casJavascriptFile}" />"></script>
    <script type="text/javascript" src="<c:url value="${bootstrapJavascriptFile}" />"></script>
  </body>
</html>

