package webapp.jpa_escola.Repository;

import org.springframework.data.repository.CrudRepository;

import webapp.jpa_escola.Model.Administrador;

public interface AdministradorRepository extends CrudRepository<Administrador, String>{
    Administrador findByCpf (String cpf);
}
