package webapp.jpa_escola.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import webapp.jpa_escola.Model.Administrador;
import webapp.jpa_escola.Repository.AdministradorRepository;
import webapp.jpa_escola.Repository.PreCadAdmRepository;

@Controller
public class AdministradorController {
    @Autowired
    private AdministradorRepository ar;

    @Autowired
    private PreCadAdmRepository pcar;

    String cpfVerificacao = pcar.findByCpf(adm.getCpf()).getCpf();
    
        if (cpfVerificacao.equals(adm.getCpf())) {
            ar.save(adm);
            // Enviar uma mensagem de cadastro realizada com sucesso
            System.out.println("Cadastro realizado com sucesso.");
        }
        return "index";
    }

}
