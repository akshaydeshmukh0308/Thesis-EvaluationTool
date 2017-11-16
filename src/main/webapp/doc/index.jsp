<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<% 

String url = new URL(request.getScheme(), 
        request.getServerName(), 
        request.getServerPort(), 
        request.getContextPath()).toString();

 %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ProcessMining API Documentation</title>
  <link rel="shortcut icon" href="favicon.ico" />

  <link href="./assets/css" rel="stylesheet" type="text/css">
  <link href="./assets/swagger-ui.css" rel="stylesheet" type="text/css">
  <link href="./assets/custom_topHeader.css" rel="stylesheet" type="text/css">
  <link href="./assets/custom_page.css" rel="stylesheet" type="text/css">
  <style type="text/css">
  header select{
    margin: 10px;
      background: #69b93b;
      color:#fff;
  }
  header select option {
      background: #eee;
      color: #69b93b;
  }
  #header-brand {width:58%;float:left}
  #header-nav {width:38%; float:right; text-align: right;}
  </style>
</head>

<body>

<header class="header">
    <div id="header-brand">
        <h1> &nbsp; <!--  <img src="assets/okbr-logo16px.png"/> --> &nbsp; <a rel="home" style="color: #69b93b; text-decoration: none; background: 0 0;" href="../">Process Mining</a></h1>
    </div>
	  <nav id="header-nav" role="navigation" class="hidden-xs">
    API:  <select id="headerSelect" onchange="swaggerReload(this.value)">
		<option value="process-mining">Process Mining API v1.x</option>
      </select>
	  </nav>
</header>


<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="position:absolute;width:0;height:0">
  <defs>
    <symbol viewBox="0 0 20 20" id="unlocked">
          <path d="M15.8 8H14V5.6C14 2.703 12.665 1 10 1 7.334 1 6 2.703 6 5.6V6h2v-.801C8 3.754 8.797 3 10 3c1.203 0 2 .754 2 2.199V8H4c-.553 0-1 .646-1 1.199V17c0 .549.428 1.139.951 1.307l1.197.387C5.672 18.861 6.55 19 7.1 19h5.8c.549 0 1.428-.139 1.951-.307l1.196-.387c.524-.167.953-.757.953-1.306V9.199C17 8.646 16.352 8 15.8 8z"></path>
    </symbol>

    <symbol viewBox="0 0 20 20" id="locked">
      <path d="M15.8 8H14V5.6C14 2.703 12.665 1 10 1 7.334 1 6 2.703 6 5.6V8H4c-.553 0-1 .646-1 1.199V17c0 .549.428 1.139.951 1.307l1.197.387C5.672 18.861 6.55 19 7.1 19h5.8c.549 0 1.428-.139 1.951-.307l1.196-.387c.524-.167.953-.757.953-1.306V9.199C17 8.646 16.352 8 15.8 8zM12 8H8V5.199C8 3.754 8.797 3 10 3c1.203 0 2 .754 2 2.199V8z"></path>
    </symbol>

    <symbol viewBox="0 0 20 20" id="close">
      <path d="M14.348 14.849c-.469.469-1.229.469-1.697 0L10 11.819l-2.651 3.029c-.469.469-1.229.469-1.697 0-.469-.469-.469-1.229 0-1.697l2.758-3.15-2.759-3.152c-.469-.469-.469-1.228 0-1.697.469-.469 1.228-.469 1.697 0L10 8.183l2.651-3.031c.469-.469 1.228-.469 1.697 0 .469.469.469 1.229 0 1.697l-2.758 3.152 2.758 3.15c.469.469.469 1.229 0 1.698z"></path>
    </symbol>

    <symbol viewBox="0 0 20 20" id="large-arrow">
      <path d="M13.25 10L6.109 2.58c-.268-.27-.268-.707 0-.979.268-.27.701-.27.969 0l7.83 7.908c.268.271.268.709 0 .979l-7.83 7.908c-.268.271-.701.27-.969 0-.268-.269-.268-.707 0-.979L13.25 10z"></path>
    </symbol>

    <symbol viewBox="0 0 20 20" id="large-arrow-down">
      <path d="M17.418 6.109c.272-.268.709-.268.979 0s.271.701 0 .969l-7.908 7.83c-.27.268-.707.268-.979 0l-7.908-7.83c-.27-.268-.27-.701 0-.969.271-.268.709-.268.979 0L10 13.25l7.418-7.141z"></path>
    </symbol>

    <symbol viewBox="0 0 24 24" id="jump-to">
      <path d="M19 7v4H5.83l3.58-3.59L8 6l-6 6 6 6 1.41-1.41L5.83 13H21V7z"></path>
    </symbol>

    <symbol viewBox="0 0 24 24" id="expand">
      <path d="M10 18h4v-2h-4v2zM3 6v2h18V6H3zm3 7h12v-2H6v2z"></path>
    </symbol>

  </defs>
</svg>

<div id="swagger-ui">
  <section data-reactroot="" class="swagger-ui swagger-container"></section>
</div>


<script src="./assets/swagger-ui-bundle.js"> </script>
<script src="./assets/swagger-ui-standalone-preset.js"> </script>

<script>
// CONFIGURAtIONS:
var hash_URLs = {
    "process-mining":     "api-json/swagger.json"
};
var hash_default = 'process-mining';

window.onload = function() {
  // Prepare the URL
  var hash_opt = window.location.hash.substr(1);
  var opt = (hash_opt>'' && hash_opt in hash_URLs)? hash_opt: hash_default;

  document.getElementById('headerSelect').value = opt;
  swaggerReload(opt);
}

function swaggerReload(opt){
  var swaggerURL = hash_URLs[opt];

  // Build a system
  var ui = SwaggerUIBundle({
    url: swaggerURL,
    validatorUrl: null,
    dom_id: '#swagger-ui',
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    plugins: [
      SwaggerUIBundle.plugins.DownloadUrl
    ],
    layout: "StandaloneLayout"
  })
  window.ui = ui
}
</script>


</body>
</html>