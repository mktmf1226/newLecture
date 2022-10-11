<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Polar Clock</title>
	<link rel="stylesheet" type="text/css" href="./inspector.css">
</head>
<body>
	<script type="module">

	import define from "./index.js";
	import {Runtime, Library, Inspector} from "./runtime.js";

	const runtime = new Runtime();
	const main = runtime.module(define, Inspector.into(document.body));

	</script>

</body>
</html>