<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
		<title>Cadastro de Autores</title>
	</head>
	<body class="container">
		<div class="container border mt-2 rounded">
			<div class="row bg-light">
				<div class="col">
					<h1 class="text-center">Cadastro de Autores</h1>
				</div>
			</div>
			<div class="row border">
				<form action="<c:url value="/autores" />" accept-charset="iso-8859-1,utf8" method="POST">
					<div class="form-group">
						<label for="nome">Nome</label>
						<input id="nome" class="form-control" name="nome">
						<label for="email">E-mail</label>
						<input id="email" class="form-control" name="email">
						<label for="dataNascimento">Data de Nascimento</label>
						<input id="dataNascimento" class="form-control" name="dataNascimento">
						<label for="miniCurriculo">Mini Currículo</label>
						<textarea id="miniCurriculo" class="form-control" name="miniCurriculo"></textarea>
		<!-- 				<input id='miniCurriculo' class="form-control" name="miniCurriculo"> -->
					</div>
					<input type="submit" value="Cadastrar" class="mt-2 mb-2 btn-primary rounded">
				</form>
			 </div>
		</div>
		<div class="container mt-2 border rounded">
			<div class="row bg-light">
				<h1 class="text-center">Lista de Autores</h1>
			</div>
			<table class="table table-striped table-hover table-bordered mt-1">
				<thead>
					<tr class="table-primary">
						<th>Nome</th>
						<th>E-mail</th>
						<th class="text-center">Data de Nascimento</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${autores}" var="a">
						<tr data-bs-toggle="tooltip" data-bs-placement="top" title="${a.miniCurriculo}">
							<td>${a.nome}</td>
							<td>${a.email}</td>
							<td class="text-center">${a.dataFormatada}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>