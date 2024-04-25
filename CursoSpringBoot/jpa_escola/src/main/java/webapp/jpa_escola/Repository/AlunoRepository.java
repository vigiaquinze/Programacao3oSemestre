package webapp.jpa_escola.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.jpa_escola.Model.Aluno;

public interface AlunoRepository extends CrudRepository<Aluno, String>{
    Aluno findByCpf (String cpf);
}
