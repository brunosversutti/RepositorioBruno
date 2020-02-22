<%@page import="DTO.AlunoDTO" %>
<%@page import="DAO.AlunoDAO" %>
<%@page import="DTO.SemestreDTO" %>
<%@page import="DAO.SemestreDAO" %>
<%@page import="VO.AlunoVO" %>
<%@page import="VO.SemestreVO" %>

<%@ page import = "java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page errorPage="/Util/PaginaDeErro.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<jsp:useBean id="alunoVO" class="VO.AlunoVO"></jsp:useBean>	
<jsp:useBean id="semestreVO" class="VO.SemestreVO"></jsp:useBean>
<jsp:useBean id="semestreDTO" class="DTO.SemestreDTO"></jsp:useBean>
<jsp:useBean id="alunoDTO" class="DTO.AlunoDTO"></jsp:useBean>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.min.js"></script>
<title>ACADEMICS || Cadastro de Cursos</title>
</head>
<body>
	<header>
	<div id="header">
		<div class="container">
			<div class="col-lg-3 logo">
				<a href="/Academics/gerenciador/menu.jsp"><img
					src="/Academics/content/imagens/LOGO.png" alt="ACADEMICS"></a>
			</div>
			<div class="col-lg-9">
				<nav id="menuprincipal">
				<ul>
					<li><a href="/Academics/gerenciador/menu.jsp">Home</a></li>
					<li><a href="/Academics/cidades/lista.jsp">Criar Lista de
							Cursos - Nao esquecer</a></li>
					<li><a href="/Academics/Login/logoff.jsp">Sair</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
	</header>
	<div class="container">

		<h2>Vincular Aluno ao Semestre</h2>
		
	<%
	
		ArrayList<AlunoDTO> alunos = (ArrayList) alunoVO.getAlunos();
		ArrayList<SemestreDTO> semestres = (ArrayList) semestreVO.getSemestre(); 	
	
		if(request.getAttribute("alunoSelecionado") == null)
				request.setAttribute("alunoSelecionado", "0");
		String alunoSelecionado = (String)request.getAttribute("alunoSelecionado");
		
		if(request.getAttribute("semestreSelecionado") == null)
			request.setAttribute("semestreSelecionado", "0");
		String semestreSelecionado = (String)request.getAttribute("semestreSelecionado");
		
	
	%>	
		

		<form class="col-md-5 col-md-offset-4" name="frmaluno" action="../Servlets/ServletAlunoSemestre" method="post">
			 
			
			<label> Aluno:</label><BR>
			 <select name="aluno" class="form-control">
				<%
						for (int i = 0; i < alunos.size(); i++) {
					%>
						<option value= <%=alunos.get(i).getCodigo()%>> <%=alunos.get(i).getPessoa().getNome()%> - RA: <%=alunos.get(i).getrA()%></option>
					<%
						}
				%>
			</select> <br> <br>
			 <label> Semestre:</label><BR>
			 <select name="semestre" class="form-control">
				<%
						for (int i = 0; i < semestres.size(); i++) {
				%>
						<option value= <%=semestres.get(i).getCodigo()%>> <%=semestres.get(i).getPeriodo()%> - <%=semestres.get(i).getAno()%></option>
				<%
					}
				%>
			</select> <br> <br>
			 
			<input type="submit" name="inserirCurso" value="Salvar" class="btn btn-lg btn-primary btn-block" onclick="VerificaCPF();">
		</form>
	</div>
	<footer>
	<div class="container">
		<div class="col-md-offset-4">Desenvolvido por ACADEMICS� - Todos os direitos reservados.</div>
	</div>
	</footer>
</body>
</html>