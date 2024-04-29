package webapp.jpa_escola.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.annotation.PostConstruct;
import webapp.jpa_escola.Model.Professor;
import webapp.jpa_escola.Repository.ProfessorRepository;
import webapp.jpa_escola.Controller.AdministradorController;

@Controller
public class ProfessorController {
    @Autowired
    private ProfessorRepository profr;

    @Autowired
    private AdministradorController admc;

    boolean acessoProf = false;

    @PostMapping("cad-prof")
    public ModelAndView cadastroprofBD(Professor prof, RedirectAttributes attributes) {

        ModelAndView mv = new ModelAndView("redirect:/login-prof");

        boolean verificaCpf = profr.existsById(prof.getCpf());
        boolean verificaEmail = profr.existsById(prof.getEmail());

        if (verificaCpf == false && verificaEmail == false) {
            profr.save(prof);
            String mensagem = "Cadastro realizado com sucesso";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "verde");
        } else {
            String mensagem = "Erro! CPF ou email já cadastrados.";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }

        return mv;
    }

    @PostMapping("acesso-prof")
    public ModelAndView acessoAdmLogin(@RequestParam String cpf,
            @RequestParam String senha,
            RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-prof");// página interna de acesso
        try {
            // boolean acessoCPF = cpf.equals(ar.findByCpf(cpf).getCpf());
            boolean acessoCPF = profr.existsById(cpf);
            boolean acessoSenha = senha.equals(profr.findByCpf(cpf).getSenha());

            if (acessoCPF && acessoSenha) {
                acessoProf = true;
                String nomeProf = profr.findByCpf(cpf).getNome();
                String materiaProf = profr.findByCpf(cpf).getDisciplina();
                String materia2Prof = profr.findByCpf(cpf).getDisciplina2();
                System.out.println(nomeProf);
                System.out.println(materiaProf);
                System.out.println(materia2Prof);
                attributes.addFlashAttribute("nomedoprof", nomeProf);
                attributes.addFlashAttribute("materiadoprof", materiaProf);
                attributes.addFlashAttribute("materia2doprof", materia2Prof);
                mv.setViewName("redirect:/interna-prof");
            } else {
                String mensagem = "Erro! Credenciais inválidas";
                System.out.println(mensagem);
                attributes.addFlashAttribute("msg", mensagem);
                attributes.addFlashAttribute("classe", "vermelho");
                mv.setViewName("redirect:/login-prof");
            }
            return mv;

        } catch (Exception e) {
            String mensagem = "Erro! Credenciais inválidas ou não existem.";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-prof");
            return mv;
        }

    }

    @GetMapping("/interna-prof")
    public ModelAndView acessoPageInternaProf(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("interna/interna-prof");
        if (acessoProf) {
            System.out.println("Acesso permitido!");
        } else {
            String mensagem = "Acesso negado. Faça login.";
            System.out.println(mensagem);
            mv.setViewName("redirect:/login-prof");
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }
        return mv;
    }

    @PostMapping("logout-prof")
    public ModelAndView logoutprof(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-prof");
        attributes.addFlashAttribute("msg", "Logout efetuado.");
        attributes.addFlashAttribute("classe", "verde");
        acessoProf = false;
        return mv;
    }

}
