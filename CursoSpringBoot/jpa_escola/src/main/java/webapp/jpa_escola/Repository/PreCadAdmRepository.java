package webapp.jpa_escola.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.jpa_escola.Model.PreCadAdm;

public interface PreCadAdmRepository extends CrudRepository<PreCadAdm, String>{
    PreCadAdm findByCpf (String cpf);
}
