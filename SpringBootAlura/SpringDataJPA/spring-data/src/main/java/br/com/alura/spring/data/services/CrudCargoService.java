package br.com.alura.spring.data.services;

import java.util.Scanner;

import org.springframework.stereotype.Service;

import br.com.alura.spring.data.orm.Cargo;
import br.com.alura.spring.data.repositories.CargoRepository;

@Service
public class CrudCargoService {

	private final CargoRepository cargoRepository;
	
	public CrudCargoService(CargoRepository cargoRepository) {
		this.cargoRepository = cargoRepository;
	}
	
	public void inicial(Scanner scanner) {
		salvar(scanner);
	}
	
	public void atualizarCargo(Scanner scanner) {
		atualizar(scanner);
	}
	
	private void salvar(Scanner scanner) {
		System.out.println("Descrição do cargo:");
		String descricao = scanner.next();
		Cargo cargo = new Cargo();
		cargo.setDescricao(descricao);
		cargoRepository.save(cargo);
		System.out.println("Salvo!");
	}

	private void atualizar(Scanner scanner) {
		System.out.println("Descrição e id do cargo:");
		Integer id = scanner.nextInt();
		String descricao = scanner.next();
		Cargo cargo = new Cargo();
		cargo.setId(id);
		cargo.setDescricao(descricao);
		cargoRepository.save(cargo);
		System.out.println("Atualizado!");
	}
}
