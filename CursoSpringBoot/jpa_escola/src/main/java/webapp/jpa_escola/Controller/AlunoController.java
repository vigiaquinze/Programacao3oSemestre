package webapp.jpa_escola.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import webapp.jpa_escola.Model.Aluno;
import webapp.jpa_escola.Repository.AlunoRepository;
import webapp.jpa_escola.Controller.AdministradorController;

@Controller
public class AlunoController {
    @Autowired
    private AlunoRepository alunor;

    boolean acessoAluno = false;

    @PostMapping("cad-aluno")
    public ModelAndView cadastroalunoBD(Aluno aluno, RedirectAttributes attributes) {

        ModelAndView mv = new ModelAndView("redirect:/login-aluno");

        boolean verificaCpf = alunor.existsById(aluno.getCpf());
        boolean verificaEmail = alunor.existsById(aluno.getEmail());

        if (verificaCpf == false && verificaEmail == false) {
            alunor.save(aluno);
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

    @PostMapping("acesso-aluno")
    public ModelAndView acessoAdmLogin(@RequestParam String cpf,
            @RequestParam String senha,
            RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-aluno");// página interna de acesso
        try {
            // boolean acessoCPF = cpf.equals(ar.findByCpf(cpf).getCpf());
            boolean acessoCPF = alunor.existsById(cpf);
            boolean acessoSenha = senha.equals(alunor.findByCpf(cpf).getSenha());

            if (acessoCPF && acessoSenha) {
                acessoAluno = true;
                String nomeAluno = alunor.findByCpf(cpf).getNome();
                System.out.println(nomeAluno);
                attributes.addFlashAttribute("nomedoaluno", nomeAluno);
                mv.setViewName("redirect:/interna-aluno");
            } else {
                String mensagem = "Erro! Credenciais inválidas";
                System.out.println(mensagem);
                attributes.addFlashAttribute("msg", mensagem);
                attributes.addFlashAttribute("classe", "vermelho");
                mv.setViewName("redirect:/login-aluno");
            }
            return mv;

        } catch (Exception e) {
            String mensagem = "Erro! Credenciais inválidas ou não existem.";
            System.out.println(mensagem);
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
            mv.setViewName("redirect:/login-aluno");
            return mv;
        }

    }

    @GetMapping("/interna-aluno")
    public ModelAndView acessoPageInternaaluno(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("interna/interna-aluno");
        if (acessoAluno) {
            System.out.println("Acesso permitido!");
        } else {
            String mensagem = "Acesso negado. Faça login.";
            System.out.println(mensagem);
            mv.setViewName("redirect:/login-aluno");
            attributes.addFlashAttribute("msg", mensagem);
            attributes.addFlashAttribute("classe", "vermelho");
        }
        return mv;
    }

    @PostMapping("logout-aluno")
    public ModelAndView logoutaluno(RedirectAttributes attributes) {
        ModelAndView mv = new ModelAndView("redirect:/interna-aluno");
        attributes.addFlashAttribute("msg", "Logout efetuado.");
        attributes.addFlashAttribute("classe", "verde");
        acessoAluno = false;
        return mv;
    }

}
