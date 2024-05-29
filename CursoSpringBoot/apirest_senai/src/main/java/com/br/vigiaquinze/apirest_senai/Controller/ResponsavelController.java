package com.br.vigiaquinze.apirest_senai.Controller;

import org.springframework.web.bind.annotation.RestController;

import com.br.vigiaquinze.apirest_senai.Repository.ResponsavelRepository;
import com.br.vigiaquinze.apirest_senai.Model.Responsavel;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
    
}
