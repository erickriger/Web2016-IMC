<html>
<body>
	<h2>Cálculo de Índice de Massa Corporal (IMC)</h2>
	<form>
		Altura (m): <input name="altura">
		<br>
		Peso (kg): <input name="peso">
		<br>
		<button>Calcular</button>
	</form>
	
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
	resultado = calcularImc(altura, peso);
	
	String classificacao = "";
	classificacao = classificarImcHomem(resultado);
	
	if (resultado >= 0) {
		out.println("IMC: " + resultado);
		out.print("Classificação: " + classificacao);
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
