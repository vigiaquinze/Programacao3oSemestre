package webapp.jpa_escola.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.jpa_escola.Model.Professor;

public interface ProfessorRepository extends CrudRepository<Professor, String>{
    Professor findByCpf(String cpf);
}
