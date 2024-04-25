package webapp.jpa_escola.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webapp.jpa_escola.Model.Administrador;
import webapp.jpa_escola.Repository.AdministradorRepository;
import webapp.jpa_escola.Repository.PreCadAdmRepository;

@Controller
public class AdministradorController {
    @Autowired
    private AdministradorRepository admr;

    @Autowired
    private PreCadAdmRepository pcar;

    boolean acessoAdm = false;
    
    @PostMapping("cad-adm")
    public ModelAndView cadastroAdmBD(Administrador adm, RedirectAttributes attributes) {

        boolean verificaCpf = pcar.existsById(adm.getCpf());

        ModelAndView mv = new ModelAndView("redirect:/login-adm");

        if (verificaCpf) {
            admr.save(adm);
            String mensagem = "Cadastro realizado com sucesso";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "verde");
        } else {
            String mensagem = "Erro! Cadastro inválido. Verifique o pré-cadastro ou entre em contato com a secretaria.";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }

        return mv;
    }

        @PostMapping("acesso-adm")
        public ModelAndView acessoAdmLogin(@RequestParam String cpf,
        @RequestParam String senha,
        RedirectAttributes attributes) {
    ModelAndView mv = new ModelAndView("redirect:/interna-adm");// página interna de acesso
    try {
        // boolean acessoCPF = cpf.equals(ar.findByCpf(cpf).getCpf());
        boolean acessoCPF = admr.existsById(cpf);
        boolean acessoSenha = senha.equals(admr.findByCpf(cpf).getSenha());

        if (acessoCPF && acessoSenha) {
            acessoAdm = true;
        } else {
            String mensagem = "Erro! Credenciais inválidas";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-adm");
        }
        return mv;
        
    } catch (Exception e) {
        String mensagem = "Erro! Credenciais inválidas ou não existem.";
        System.out.println(mensagem);
        attributes.addFlashAttribute("msg", mensagem);
        attributes.addFlashAttribute("classe", "vermelho");
        mv.setViewName("redirect:/login-adm");
        return mv;
    }
   
}

    
    @GetMapping("/interna-adm")
    public ModelAndView acessoPageInternaAdm(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("interna/interna-adm");
        if (acessoAdm) {
            System.out.println("Acesso permitido!");
        } else {
            String mensagem = "Acesso negado. Faça login.";
            System.out.println(mensagem);
            mv.setViewName("redirect:/login-adm");
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }
        return mv;
    }

    @PostMapping("logout-adm")
    public ModelAndView logoutAdm(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-adm");
        attributes.addFlashAttribute("msg", "Logout efetuado.");
        attributes.addFlashAttribute("classe", "verde");
        acessoAdm = false;
        return mv;
    }

}
