package webapp.jpa_escola.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webapp.jpa_escola.Controller.AdministradorController;

@Controller
public class IndexController {
    AdministradorController admc = new AdministradorController();
    boolean acessoAdm = admc.acessoAdm;
    
    @GetMapping("/home")
    public ModelAndView acessoHomePage() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
    @GetMapping("")
    public ModelAndView acessoHomePage2() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }
    @GetMapping("/login-adm")
    public ModelAndView acessoLoginAdm(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("");
        if (acessoAdm) {
            mv.setViewName("redirect:/home");
        } else {
            mv.setViewName("redirect:/login-adm");
        }
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
    
}
