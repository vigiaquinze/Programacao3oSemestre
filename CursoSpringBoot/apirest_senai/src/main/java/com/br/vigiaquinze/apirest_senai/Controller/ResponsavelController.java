package com.br.vigiaquinze.apirest_senai.Controller;

import org.springframework.web.bind.annotation.RestController;

import com.br.vigiaquinze.apirest_senai.Repository.ResponsavelRepository;
import com.br.vigiaquinze.apirest_senai.Model.AtivoPatrimonial;
import com.br.vigiaquinze.apirest_senai.Model.Responsavel;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.br.vigiaquinze.apirest_senai.Model.Responsavel;
import com.br.vigiaquinze.apirest_senai.Repository.ResponsavelRepository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
@RequestMapping("/responsaveis")
public class ResponsavelController {

    @Autowired
    private ResponsavelRepository repository;

    @GetMapping
    public List<Responsavel> getAllResponsavel() {
        return (List<Responsavel>) repository.findAll();
    }

    @PostMapping
    public Responsavel createResponsavel(@RequestBody Responsavel responsavel) {
        return repository.save(responsavel);
    }

    @GetMapping("/{id}")
    public Optional<Responsavel> getAtivoById(@PathVariable Long id) {
        return repository.findById(id);
    }

    @PutMapping("/{id}")
    public Responsavel putResponsavel(@PathVariable Long id, @RequestBody Responsavel responsavel) {
        if (repository.existsById(id)) {
            responsavel.setId(id);
            return repository.save(responsavel);
        } else {
            return null;
        }
    }

    @DeleteMapping("/{id}")
    public List<Responsavel> DeleteResponsvel(@PathVariable Long id) {
        repository.deleteById(id);
        return (List <Responsavel>)repository.findAll();
    }
}
