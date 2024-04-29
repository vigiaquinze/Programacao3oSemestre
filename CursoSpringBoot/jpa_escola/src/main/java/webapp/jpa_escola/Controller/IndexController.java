package webapp.jpa_escola.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webapp.jpa_escola.Controller.AdministradorController;

@Controller
public class IndexController {
    
    @GetMapping("/home")
    public ModelAndView acessoHomePage() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
    @GetMapping("/sobre")
    public ModelAndView acessoSobre() {
        ModelAndView mv = new ModelAndView("sobre");
        return mv;
    }
    @GetMapping("/contato")
    public ModelAndView acessoContato() {
        ModelAndView mv = new ModelAndView("contato");
        return mv;
    }
    @GetMapping("")
    public ModelAndView acessoHomePage2() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
    @GetMapping("/login-adm")
    public ModelAndView acessoLoginAdm() {
        ModelAndView mv = new ModelAndView("login/login-adm");
        return mv;
    }
    @GetMapping("/cad-adm")
    public String acessoCadastroAdm() {
        return "cadastro/cad-adm";
    }
    @GetMapping("/login-prof")
    public ModelAndView acessoLoginProf() {
        ModelAndView mv = new ModelAndView("login/login-prof");
        return mv;
    }
    @GetMapping("/cad-prof")
    public String acessoCadastroProf(){
        return "cadastro/cad-prof";
    }
    @GetMapping("/login-aluno")
    public ModelAndView acessoLoginAluno() {
        ModelAndView mv = new ModelAndView("login/login-aluno");
        return mv;
    }
}
