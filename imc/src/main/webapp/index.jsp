<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
	<title>Cálculo de IMC</title>
</head>
<body>
	<div class="well bs-component">
		<form role="form" class="form-horizontal">
			<fieldset>
				<legend>Cálculo de Índice de Massa Corporal (IMC)</legend>
				<div class="form-group">
					<label for="altura" class="col-lg-1 control-label">Altura (m): </label>
					<div class="col-lg-2">
						<input type="text" class="form-control" id="altura" name="altura" placeholder="Altura">
					</div>
				</div>
				<div class="form-group">
					<label for="peso" class="col-lg-1 control-label">Peso (kg):	</label>
					<div class="col-lg-2">
						<input type="text" class="form-control" id="peso" name="peso" placeholder="Peso">
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-1">
						<button class="btn btn-primary">Calcular</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<%
	String alturaStr = "";
	alturaStr = request.getParameter("altura");
	String pesoStr = "";
	pesoStr = request.getParameter("peso");
	float altura = 0;
	float peso = 0;
	
	try {
		altura = alturaStr == null ? 0 : Float.parseFloat(alturaStr);
	} catch (Exception ex) {
		out.print("Valor inválido para altura.");
	}
	
	try {
		peso = pesoStr == null ? 0 : Float.parseFloat(pesoStr);
	} catch (Exception ex) {
		out.print("Valor inválido para peso.");
	}
	
	float resultado = 0;
	String classificacao = "";
	String saida = "";
	
	if (altura != 0 && peso != 0) {
		resultado = calcularImc(altura, peso);
		classificacao = classificarImcHomem(resultado);
		saida = "IMC: " + resultado + ". Classificação: " + classificacao + ".";
	%>
	<script type="text/javascript">
			window.onload = function() {
				var mensagem = "<%=saida%>";
			alert(mensagem);
			document.Form.submit();
		};
	</script>
	<%
	}
	%>
	<%!
	public float calcularImc(float altura, float peso) {
		return peso / (altura * altura);
	}
	
	public String classificarImcHomem(float imc) {
		String result = "";
		if (imc < 16) {
			result = "Magreza grave";
		}
		else if (imc >= 16 && imc < 17) {
			result = "Magreza moderada";
		}
		else if (imc >= 17 && imc < 18.5) {
			result = "Magreza leve";
		}
		else if (imc >= 18.5 && imc < 25) {
			result = "Saudável";
		}
		else if (imc >= 25 && imc < 30) {
			result = "Sobrepeso";
		}
		else if (imc >= 30 && imc < 35) {
			result = "Obesidade Grau I";
		}
		else if (imc >= 35 && imc < 40) {
			result = "Obesidade Grau II (severa)";
		}
		else if (imc >= 40) {
			result = "Obesidade Grau III (mórbida)";
		}
		
		return result;		
	}	
	%>

</body>
</html>
