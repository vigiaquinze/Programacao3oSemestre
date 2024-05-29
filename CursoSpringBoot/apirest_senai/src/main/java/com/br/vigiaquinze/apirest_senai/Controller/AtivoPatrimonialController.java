package com.br.vigiaquinze.apirest_senai.Controller;

import org.springframework.web.bind.annotation.RestController;

import com.br.vigiaquinze.apirest_senai.Repository.AtivoPatrimonialRepository;
import com.br.vigiaquinze.apirest_senai.Model.AtivoPatrimonial;

import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;



@RestController
@RequestMapping("/ativos")
public class AtivoPatrimonialController {

    @Autowired
    private AtivoPatrimonialRepository repository;

    @GetMapping
    public List<AtivoPatrimonial> getAllAtivo() {
        return (List<AtivoPatrimonial>) repository.findAll();
    }
    
    @PostMapping
    public AtivoPatrimonial createAtivo(@RequestBody AtivoPatrimonial ativo) {
        return repository.save(ativo);
    }
    
}
