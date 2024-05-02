package br.com.vigiaquinze.gamestore.Repository;

import org.springframework.data.repository.CrudRepository;

import br.com.vigiaquinze.gamestore.Model.Game;

public interface GameRepository extends CrudRepository<Game, Integer>{

}
