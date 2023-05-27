/* Equipe DS.7 formada por:
 * Eduardo Amorim
 * João Mateus
 * Karen Freitas
 */

programa
{
	funcao inicio ()
	{
		
//Declarando as variavéis necessárias:

	logico lacoRepeticao = verdadeiro
	cadeia nome = " "
	
	inteiro opcaoMenu, numAgencia = 0, numConta = 0, digitoVerificadorCC = 3, digitoVerificadorCP = 9, opcao
	real saldoCC = 0.0, saldoCP = 0.0, depositoInicial, novoDeposito, valorSaque, aplicarNaPoupanca, resgatarNaPoupanca
	
	escreva("Bem-Vindo ao banco DS.7!\n\n")
	
	faca{
		
//Neste Menu o usuário poderá escolher a opção desejada:

		escreva("Digite uma opcao: \n")
		escreva("1 - Criar conta \n")
		escreva("2 - Ver saldo da conta \n")
		escreva("3 - Ver dados da conta \n")
		escreva("4 - Depósito na conta corrente \n")
		escreva("5 - Saque na conta corrente \n")
		escreva("6 - Aplicar na poupança \n")
		escreva("7 - Resgatar na poupança \n")
		escreva("8 - Sair \n")
		escreva("Digite: ")
		leia(opcaoMenu)
			se(opcaoMenu != 1 ou opcaoMenu != 2 ou opcaoMenu != 3 ou opcaoMenu != 4 ou opcaoMenu != 5 ou opcaoMenu != 6 ou opcaoMenu != 7 ou opcaoMenu != 8){
				limpa()
				escreva("Digite um valor válido!\n\n")
			}
/* Após o usuário ter escolhido a opção desejada, iremos direciona-lo a devida opção. 
 * Abaixo podemos ver.
 */
		     escolha(opcaoMenu){
		     	
/* No caso 1 iremos pedir os dados necessários para preencher as variavéis: nome, numAgencia e
 * numConta. E no final iremos perguntar se ele deseja realizar um depósito inicial.
 */
			 caso 1:
			 limpa()
			 	escreva("Digite seu nome: ")
			 	leia(nome)
			 	escreva("Digite sua agência: ")
			 	leia(numAgencia)
			 	escreva("Digite o número da sua conta: ")
			 	leia(numConta)
			 	escreva("Deseja realizar um depósito inicial ?\n")
			 	escreva("1 - Sim / 2 - Não: ")
			 	leia(opcao)
			 		se(opcao == 1){
			 			escreva("Digite um valor: ")
			 			leia(depositoInicial)
			 		saldoCC = saldoCC + depositoInicial
			 	}
			 	limpa()
			 	escreva("Conta criada com sucesso!\n\n")
			 	
			 pare

/* No caso 2 iremos mostrar o saldo da conta do usuário, tanto o saldo da 
 * conta corrente quanto o saldo da conta poupança.
 * inicialmente o usuário começa com o saldo em 0.0 em ambas as contas.
 */
			 caso 2: 
			 limpa()
			 	escreva("\n")
		      	escreva("Seu saldo na conta corrente é R$" + saldoCC + "\n")
		      	escreva("Seu saldo na conta poupança é R$" + saldoCP + "\n")
		      	escreva("\n")
			 pare
			 
/*  No caso 3 iremos apenas mostrar os dados do usuário que foi informado no caso 1.
 *  Lembrando que os dígitos verificadores foram declarados com seus respectivos valores
 *  na linha 11 como inteiro, então iremos fazer apenas a concatenação entre o número da 
 *  conta e o dígito verificador.
 */
			 caso 3:
			 limpa()
			 	escreva("Nome do titular: " + nome + "\n")
				escreva("Agência: " + numAgencia + "\n")
				escreva("Conta Corrente: " + numConta + "-" + digitoVerificadorCC + "\n")
				escreva("Conta poupança: " + numConta + "-" + digitoVerificadorCP + "\n")
				escreva("\n")
			pare

/*
 *  No caso 4 é onde o usuário irá fazer depósitos.
 */

			caso 4:
			limpa()
				escreva("Digite o valor desejado para o depósito: ")
				leia(novoDeposito)
					se(novoDeposito <= 0){
						limpa()
						escreva("Na próxima vez digite um valor positivo!!!\n\n")
					}senao{
						limpa()
						saldoCC = saldoCC + novoDeposito
						escreva("Depósito realizado com sucesso!\n\n")
					}
					
			pare

/*
 *  No caso 5 é onde o usuário irá realizar saques.
 *  Com uma obervação, o valor desejado para o saque não pode 
 *  ser maior que o valor que o usuário tenha na conta.
 */

			caso 5:
			limpa()
				escreva("Digite o valor desejado para saque: ")
				leia(valorSaque)
					se(valorSaque < 0 ou valorSaque > saldoCC){
						limpa()
						escreva("!!! Saldo insuficiente, digite um valor disponível na sua conta !!!\n\n")
						escreva("Seu saldo na conta corrente é R$" + saldoCC + "\n\n")
					}senao{
						limpa()
						escreva("Valor resgatado com sucesso!\n\n")
						saldoCC = saldoCC - valorSaque
					}
					
			pare

/*
 *  No caso 6 o usuário poderá adicionar um determinado saldo disponível na conta corrente,
 *  na conta poupança.
 *  Com uma observação, o valor desejado não pode ser maior que o valor disponível na 
 *  conta corrente.
 */

			caso 6:
			limpa()
				escreva("Digite o valor que deseja aplicar na poupança: ")
				leia(aplicarNaPoupanca)
					se(aplicarNaPoupanca <= 0 ou aplicarNaPoupanca > saldoCC){
						limpa()
						escreva("!!! Saldo insuficiente, digite um valor válido para efetuar a operação !!!\n\n")
						escreva("Seu saldo na conta corrente é R$" + saldoCC + "\n\n")
					}senao{
						limpa()
						saldoCP = saldoCP + aplicarNaPoupanca
						saldoCC = saldoCC - aplicarNaPoupanca
						escreva("valor aplicado com sucesso!!\n\n")
					}
					
			pare

/*
 *  No caso 7 o usuário poderá resgatar um determinado valor que possui na conta poupança
 *  e enviar para a conta corrente.
 *  Com uma observação, o valor desejado para o resgate não pode ser maior que o valor disponivél
 *  na conta poupança.
 */
				
			caso 7:
			limpa()
				escreva("Digite o valor que deseja resgatar: ")
				leia(resgatarNaPoupanca)
					se(resgatarNaPoupanca > saldoCP ou resgatarNaPoupanca < 0){
						limpa()
						escreva("!!! Saldo insuficiente, digite um valor válido para efetuar a operação !!!\n\n")
						escreva("Seu saldo na conta poupança é R$" + saldoCP + "\n\n")
					}senao{
						limpa()
						saldoCC = saldoCC + resgatarNaPoupanca
						saldoCP = saldoCP - resgatarNaPoupanca
						escreva("Valor resgatado com sucesso!!\n\n")
					}
				
			pare
/*
 * No caso 8, o usuário irá sair do laço de repetição (quando o lacoRepeticao = falso), logo ele irá terminar a sessão!
 */
			caso 8:
			lacoRepeticao = falso
			pare
		
			 }
		
			 
		}enquanto(lacoRepeticao == verdadeiro)

		limpa() //-----> Limpando o console quando o usuário digitar 8(sair) e quando o lacoRepeticao = falso

		escreva("Muito obrigado por usar o banco DS.7, você sempre será Bem-Vindo :)\n")

	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1000; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4062; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */