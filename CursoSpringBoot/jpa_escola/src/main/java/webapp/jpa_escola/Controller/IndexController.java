package webapp.jpa_escola.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {
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
    public ModelAndView acessoLoginAdm() {
        ModelAndView mv = new ModelAndView("login/login-adm");
        return mv;
    }
    @GetMapping("/cadastro-adm")
    public String acessoCadastroAdm() {
        return "cadastro/cadastro-adm";
    }
    
}
