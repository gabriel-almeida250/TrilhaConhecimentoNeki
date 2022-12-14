package br.com.alura.spring.data;

import java.util.Scanner;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import br.com.alura.spring.data.services.CrudCargoService;
import br.com.alura.spring.data.services.CrudFuncionarioService;
import br.com.alura.spring.data.services.CrudUnidadeTrabalhoService;
import br.com.alura.spring.data.services.RelatorioFuncionarioDinamico;
import br.com.alura.spring.data.services.RelatoriosService;

@SpringBootApplication
public class SpringDataApplication implements CommandLineRunner {
	
	private Boolean system = true;

	private final CrudCargoService cargoService;
	private final CrudUnidadeTrabalhoService unidadeTrabalhoService;
	private final CrudFuncionarioService funcionarioService;
	private final RelatoriosService relatoriosService;
	private final RelatorioFuncionarioDinamico relatorioFuncionarioDinamico;
	
	public SpringDataApplication(CrudCargoService cargoService, 
			RelatoriosService relatoriosService, 
			CrudFuncionarioService funcionarioService, 
			CrudUnidadeTrabalhoService unidadeTrabalhoService,
			RelatorioFuncionarioDinamico relatorioFuncionarioDinamico) {
		this.cargoService = cargoService;
		this.relatoriosService = relatoriosService;
		this.funcionarioService = funcionarioService;
		this.unidadeTrabalhoService = unidadeTrabalhoService;
		this.relatorioFuncionarioDinamico = relatorioFuncionarioDinamico;
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringDataApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Scanner scanner = new Scanner(System.in);

		while (system) {
			System.out.println("Qual ação você quer executar?");
			System.out.println("0 - Sair");
			System.out.println("1 - Cargo");
			System.out.println("2 - Unidade");
			System.out.println("3 - Funcionário");
			System.out.println("4 - Relatórios");
			System.out.println("5 - Relatorio dinamico");

			Integer function = scanner.nextInt();

			switch (function) {
			case 1:
				cargoService.inicial(scanner);
				break;
			case 2:
				unidadeTrabalhoService.inicial(scanner);
				break;
			case 3:
				funcionarioService.inicial(scanner);
				break;
			case 4:
				relatoriosService.inicial(scanner);
				break;
			case 5:
				relatorioFuncionarioDinamico.inicial(scanner);
				break;
			default:
				System.out.println("Finalizando");
				system = false;
				break;
			}
		}
	}

}
