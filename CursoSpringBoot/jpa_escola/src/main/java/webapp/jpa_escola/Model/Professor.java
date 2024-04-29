package webapp.jpa_escola.Model;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Professor implements Serializable {
    @Id
    private String cpf;
    private String nome;
    private String disciplina;
    private String disciplina2;
    private String email;
    private String senha;
    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public String getDisciplina() {
        return disciplina;
    }
    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }
    public String getDisciplina2() {
        return disciplina2;
    }
    public void setDisciplina2(String disciplina2) {
        this.disciplina2 = disciplina2;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getSenha() {
        return senha;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
}
