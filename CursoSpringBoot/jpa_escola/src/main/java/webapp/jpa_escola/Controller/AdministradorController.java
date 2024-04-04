package webapp.jpa_escola.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import webapp.jpa_escola.Model.Administrador;
import webapp.jpa_escola.Repository.AdministradorRepository;
import webapp.jpa_escola.Repository.PreCadAdmRepository;

@Controller
public class AdministradorController {
    @Autowired
    private AdministradorRepository ar;

    @Autowired
    private PreCadAdmRepository pcar;

    boolean acessoAdm = false;
    
    @PostMapping("cadastrar-adm")
    public String cadastrarAdmBD(Administrador adm) {
        boolean verificaCpf = pcar.existsById(adm.getCpf());
        if (verificaCpf) {
            ar.save(adm);
            System.out.println("Cadastro Realizado com Sucesso");
        } else {
            System.out.println("Falha ao Cadastrar");
        }
        return "/login/login-adm";
    }
    
    @GetMapping("/interna-adm")
    public String acessoPageInternaAdm() {
        String vaiPara = "";
        if (acessoAdm) {
            vaiPara = "interna/interna-adm";
        } else {
            vaiPara = "login/login-adm";
        }
        return vaiPara;
    }

        @PostMapping("acesso-adm")
    public String acessoAdm(@RequestParam String cpf,
            @RequestParam String senha) {
        try {
            boolean verificaCpf = ar.existsById(cpf);
            boolean verificaSenha = ar.findByCpf(cpf).getSenha().equals(senha);
            String url = "";
            if (verificaCpf && verificaSenha) {
                acessoAdm = true;
                url = "redirect:/interna-adm";
            } else {
                url = "redirect:/login-adm";
            }
            return url;
        } catch (Exception e) {
            return "redirect:/login-adm";
        }

    }

}
