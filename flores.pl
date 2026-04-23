% | BASE PROLOG |
:- encoding(utf8).
:- dynamic caracteristica/3.
:- dynamic subclasse_cor/2.
:- dynamic dominio_atributo/2.

% --- BASE DE DADOS --- 

% ===================================================
% FLORES
% ___________________________________________________

% ---------------------------------------------------
% HIERARQUIA DE CORES DAS PETALAS
% Formato: subclasse_cor(cor_especifica, cor_geral)
% ---------------------------------------------------

% AMARELO
subclasse_cor(amarelo_palha, amarelo).
subclasse_cor(amarelo_creme, amarelo).
subclasse_cor(amarelo_limao, amarelo).
subclasse_cor(amarelo_dourado, amarelo).
subclasse_cor(amarelo_ambar, amarelo).
subclasse_cor(amarelo_mostarda, amarelo).

% LARANJA
subclasse_cor(laranja_pessego, laranja).
subclasse_cor(laranja_claro, laranja).
subclasse_cor(laranja_vivo, laranja).
subclasse_cor(laranja_cobre, laranja).
subclasse_cor(laranja_queimado, laranja).

% VERMELHO
subclasse_cor(vermelho_rosado, vermelho).
subclasse_cor(vermelho_cereja, vermelho).
subclasse_cor(vermelho_escarlate, vermelho).
subclasse_cor(vermelho_carmim, vermelho).
subclasse_cor(vermelho_bordeaux, vermelho).
subclasse_cor(vermelho_enegrecido, vermelho).

% ROSA
subclasse_cor(rosa_bebe, rosa).
subclasse_cor(rosa_quartzo, rosa).
subclasse_cor(rosa_chiclete, rosa).
subclasse_cor(rosa_coral, rosa).
subclasse_cor(rosa_pink, rosa).
subclasse_cor(rosa_fucsia, rosa).
subclasse_cor(rosa_magenta, rosa).

% ROXO
subclasse_cor(lilas, roxo).
subclasse_cor(lavanda, roxo).
subclasse_cor(violeta_claro, roxo).
subclasse_cor(violeta_medio, roxo).
subclasse_cor(violeta_intenso, roxo).
subclasse_cor(roxo_escuro, roxo).
subclasse_cor(roxo_enegrecido, roxo).

% AZUL
subclasse_cor(azul_celeste, azul).
subclasse_cor(azul_periwinkle, azul).
subclasse_cor(azul_medio, azul).
subclasse_cor(azul_cobalto, azul).
subclasse_cor(azul_indigo, azul).

% VERDE
subclasse_cor(verde_claro, verde).
subclasse_cor(verde_menta, verde).
subclasse_cor(verde_medio, verde).
subclasse_cor(verde_escuro, verde).

% BRANCO
subclasse_cor(branco_puro, branco).
subclasse_cor(branco_creme, branco).
subclasse_cor(branco_esverdeado, branco).
subclasse_cor(branco_rosado, branco).

% MULTICOLORIDA
subclasse_cor(bicolor_contrastante, multicolorida).
subclasse_cor(degrade, multicolorida).
subclasse_cor(manchada, multicolorida).
subclasse_cor(listrada, multicolorida).
subclasse_cor(com_olho_central, multicolorida).

% RELACAO CORES PETALAS
dominio_atributo(amarelo, cor_petala).
dominio_atributo(laranja, cor_petala).
dominio_atributo(vermelho, cor_petala).
dominio_atributo(rosa, cor_petala).
dominio_atributo(roxo, cor_petala).
dominio_atributo(azul, cor_petala).
dominio_atributo(verde, cor_petala).
dominio_atributo(branco, cor_petala).
dominio_atributo(multicolorida, cor_petala).

dominio_atributo(X, cor_petala) :- subclasse_cor(X, _).

% ---------------------------------------------------
% FORMATO E ESTRUTURA DAS PÉTALAS
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

% --- Forma Individual da Pétala ---
dominio_atributo(arredondada, forma_petala).
dominio_atributo(espatulada_petala, forma_petala).
dominio_atributo(lanceolada_petala, forma_petala).
dominio_atributo(linear_petala, forma_petala).
dominio_atributo(fimbriada, forma_petala).
dominio_atributo(ondulada_petala, forma_petala).
dominio_atributo(encurvada, forma_petala).
dominio_atributo(reflexa, forma_petala).

% --- Textura da Pétala ---
dominio_atributo(lisa, textura_petala).
dominio_atributo(velutinosa, textura_petala).
dominio_atributo(cerosa_petala, textura_petala).
dominio_atributo(translucida, textura_petala).
dominio_atributo(papilosa, textura_petala).

% --- Número de Pétalas ---
dominio_atributo(uma, numero_petalas).
dominio_atributo(tres, numero_petalas).
dominio_atributo(quatro, numero_petalas).
dominio_atributo(cinco, numero_petalas).
dominio_atributo(seis, numero_petalas).
dominio_atributo(oito_a_doze, numero_petalas).
dominio_atributo(treze_a_vinteuma, numero_petalas).
dominio_atributo(numerosas, numero_petalas).

% --- Disposição (Corola) ---
dominio_atributo(simples_disposicao, disposicao_corola).
dominio_atributo(semi_dupla, disposicao_corola).
dominio_atributo(dupla, disposicao_corola).
dominio_atributo(pompom, disposicao_corola).

% --- Formato Geral da Flor ---
dominio_atributo(estrelada, formato_corola).
dominio_atributo(tubular, formato_corola).
dominio_atributo(campanulada, formato_corola).
dominio_atributo(infundibuliforme, formato_corola).
dominio_atributo(rotacea, formato_corola).
dominio_atributo(bilabial, formato_corola).
dominio_atributo(papilionacea, formato_corola).
dominio_atributo(em_espata, formato_corola).
dominio_atributo(ligulada, formato_corola).
dominio_atributo(capitular, formato_corola).

% ---------------------------------------------------
% VERTICILOS FLORAIS
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

% --- Completude Geral (Cálice, Corola, Androceu e Gineceu) ---
dominio_atributo(completa, completude).
dominio_atributo(incompleta, completude).

% --- Tipo de Perianto (Presença de Cálice e Corola) ---
dominio_atributo(aclamidea, tipo_perianto).
dominio_atributo(monoclamidea, tipo_perianto).
dominio_atributo(diclamidea, tipo_perianto).

% ---------------------------------------------------
% SIMETRIA FLORAL
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(actinomorfa, simetria).
dominio_atributo(zigomorfa, simetria).
dominio_atributo(assimetrica, simetria).

% ---------------------------------------------------
% SEXUALIDADE FLORAL
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

% --- Sexualidade da Flor Individual ---
dominio_atributo(perfeita, sexualidade_flor).
dominio_atributo(imperfeita_pistilada, sexualidade_flor).
dominio_atributo(imperfeita_estaminada, sexualidade_flor).

% --- Classificação da Planta quanto ao Sexo ---
dominio_atributo(monoica, sexo_planta).
dominio_atributo(dioica, sexo_planta).
dominio_atributo(androgina, sexo_planta).
dominio_atributo(poligamica, sexo_planta).

% ---------------------------------------------------
% NÚMERO DE PEÇAS FLORAIS (MERISMO) 
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(trimera, merismo).
dominio_atributo(tetramera, merismo).
dominio_atributo(pentamera, merismo).

% ---------------------------------------------------
% INFLORESCÊNCIA (AGRUPAMENTO DE FLORES)   
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(flor_solitaria, inflorescencia).
dominio_atributo(racemo, inflorescencia).
dominio_atributo(espiga, inflorescencia).
dominio_atributo(umbela, inflorescencia).
dominio_atributo(corimbo, inflorescencia).
dominio_atributo(cimeira, inflorescencia).
dominio_atributo(capitulo, inflorescencia).
dominio_atributo(cacho, inflorescencia).
dominio_atributo(espata_espadice, inflorescencia).

% ---------------------------------------------------
% AROMA 
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

% --- Intensidade ---
dominio_atributo(inodora, intensidade_aroma).
dominio_atributo(suave, intensidade_aroma).
dominio_atributo(moderado, intensidade_aroma).
dominio_atributo(intenso, intensidade_aroma).
dominio_atributo(muito_intenso, intensidade_aroma).

% --- Categoria do Aroma ---
dominio_atributo(floral_doce, categoria_aroma).
dominio_atributo(citrico, categoria_aroma).
dominio_atributo(especiado, categoria_aroma).
dominio_atributo(frutal, categoria_aroma).
dominio_atributo(mel_nectar, categoria_aroma).
dominio_atributo(fresco_verde, categoria_aroma).
dominio_atributo(almiscarado, categoria_aroma).
dominio_atributo(desagradavel, categoria_aroma).

% --- Periodo de Liberacao do Aroma ---
dominio_atributo(diurno, periodo_aroma).
dominio_atributo(noturno, periodo_aroma).
dominio_atributo(constante, periodo_aroma).

% ---------------------------------------------------
% POLINIZAÇÃO    
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(abelhas, polinizacao).
dominio_atributo(borboletas, polinizacao).
dominio_atributo(mariposas, polinizacao).
dominio_atributo(besouros, polinizacao).
dominio_atributo(moscas, polinizacao).
dominio_atributo(passaros, polinizacao).
dominio_atributo(morcegos, polinizacao).
dominio_atributo(vento, polinizacao).
dominio_atributo(agua, polinizacao).

grupo_maior(X, flor) :- dominio_atributo(X, cor_petala); dominio_atributo(X, forma_petala); dominio_atributo(X, textura_petala); 
dominio_atributo(X, numero_petalas); dominio_atributo(X, disposicao_corola); dominio_atributo(X, formato_corola); dominio_atributo(X, completude);
dominio_atributo(X, tipo_perianto); dominio_atributo(X, simetria); dominio_atributo(X, sexualidade_flor); dominio_atributo(X, sexo_planta);
dominio_atributo(X, merismo); dominio_atributo(X, inflorescencia); dominio_atributo(X, intensidade_aroma); dominio_atributo(X, categoria_aroma);
dominio_atributo(X, periodo_aroma); dominio_atributo(X, polinizacao).

% ====================================================================
% FOLHAS
% ____________________________________________________________________

% ---------------------------------------------------
% ESTRUTURA DO LIMBO    
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(simples_estrutura, estrutura_limbo).
dominio_atributo(composta_pinada, estrutura_limbo).
dominio_atributo(composta_imparipinada, estrutura_limbo).
dominio_atributo(composta_paripinada, estrutura_limbo).
dominio_atributo(composta_bipinada, estrutura_limbo).
dominio_atributo(composta_palmada, estrutura_limbo).
dominio_atributo(composta_trifoliada, estrutura_limbo).

% ---------------------------------------------------
% FORMATO DO LIMBO     
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(circular, formato_limbo).
dominio_atributo(oval, formato_limbo).
dominio_atributo(obovada, formato_limbo).
dominio_atributo(eliptica, formato_limbo).
dominio_atributo(lanceolada_limbo, formato_limbo).
dominio_atributo(oblanceolada, formato_limbo).
dominio_atributo(linear_limbo, formato_limbo).
dominio_atributo(acicular, formato_limbo).
dominio_atributo(espatulada_limbo, formato_limbo).
dominio_atributo(reniforme, formato_limbo).
dominio_atributo(cordada, formato_limbo).
dominio_atributo(sagitada, formato_limbo).
dominio_atributo(hastada, formato_limbo).
dominio_atributo(lobada, formato_limbo).
dominio_atributo(trilobada, formato_limbo).
dominio_atributo(palmatilobada, formato_limbo).
dominio_atributo(penatilobada, formato_limbo).
dominio_atributo(laciniada, formato_limbo).

% ---------------------------------------------------
% MARGEM DO LIMBO
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(inteira, margem_limbo).
dominio_atributo(dentada, margem_limbo).
dominio_atributo(serrada, margem_limbo).
dominio_atributo(crenada, margem_limbo).
dominio_atributo(ondulada_limbo, margem_limbo).
dominio_atributo(ciliada, margem_limbo).
dominio_atributo(espinhosa, margem_limbo).

% ---------------------------------------------------
% NERVAÇÃO
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(paralelinervea, nervacao_folha).
dominio_atributo(peninervea, nervacao_folha).
dominio_atributo(arco_nervada, nervacao_folha).
dominio_atributo(palmatinervea, nervacao_folha).
dominio_atributo(uninervea, nervacao_folha).

% ---------------------------------------------------
% COR DA FOLHA
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(verde_claro_folha, cor_folha).
dominio_atributo(verde_medio_folha, cor_folha).
dominio_atributo(verde_escuro_folha, cor_folha).
dominio_atributo(verde_azulado_folha, cor_folha).
dominio_atributo(verde_amarelado_folha, cor_folha).
dominio_atributo(variegada_branca_folha, cor_folha).
dominio_atributo(variegada_amarela_folha, cor_folha).
dominio_atributo(variegada_prateada_folha, cor_folha).
dominio_atributo(avermelhada_folha, cor_folha).
dominio_atributo(bronzeada_folha, cor_folha).
dominio_atributo(cinza_folha, cor_folha).

% ---------------------------------------------------
% TEXTURA E SUPERFÍCIE DA FOLHA
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(lisa_brilhante, textura_folha).
dominio_atributo(lisa_opaca, textura_folha).
dominio_atributo(pubescente, textura_folha).
dominio_atributo(tomentosa, textura_folha).
dominio_atributo(rugosa, textura_folha).
dominio_atributo(bolhosa, textura_folha).
dominio_atributo(cerosa_folha, textura_folha).
dominio_atributo(viscosa, textura_folha).

% ---------------------------------------------------
% FOLHAS MODIFICADAS (ESPECIALIZADAS)
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(bractea, folha_modificada).
dominio_atributo(espata, folha_modificada).
dominio_atributo(espinhos_foliares, folha_modificada).
dominio_atributo(gavinhas_foliares, folha_modificada).
dominio_atributo(pitchers, folha_modificada).
dominio_atributo(suculentas, folha_modificada).
dominio_atributo(escamas, folha_modificada).
dominio_atributo(sem_modificacao_folha, folha_modificada).

grupo_maior(X, folha) :- dominio_atributo(X, estrutura_limbo); dominio_atributo(X, formato_limbo); dominio_atributo(X, margem_limbo);
dominio_atributo(X, nervacao_folha); dominio_atributo(X, cor_folha); dominio_atributo(X, textura_folha); dominio_atributo(X, folha_modificada).

% ==========================================================================
% CAULES
% __________________________________________________________________________

% ---------------------------------------------------
% CONSISTÊNCIA / TIPO BÁSICO
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(herbaceo, consistencia_caule).
dominio_atributo(sublenhoso, consistencia_caule).
dominio_atributo(lenhoso_arbusto, consistencia_caule).
dominio_atributo(lenhoso_arvore, consistencia_caule).
dominio_atributo(suculento, consistencia_caule).
dominio_atributo(trepador, consistencia_caule).
dominio_atributo(rasteiro, consistencia_caule).
dominio_atributo(rizomatoso, consistencia_caule).
dominio_atributo(bulboso, consistencia_caule).
dominio_atributo(tuberoso, consistencia_caule).

% ---------------------------------------------------
% SUPERFÍCIE DO CAULE
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(liso, superficie_caule).
dominio_atributo(piloso, superficie_caule).
dominio_atributo(aculeado, superficie_caule).
dominio_atributo(espinhoso, superficie_caule).
dominio_atributo(estriado, superficie_caule).
dominio_atributo(alado, superficie_caule).
dominio_atributo(ceroso, superficie_caule).
dominio_atributo(nodoso, superficie_caule).

% ---------------------------------------------------
% SEÇÃO TRANSVERSAL DO CAULE
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(cilindrico, secao_caule).
dominio_atributo(quadrangular, secao_caule).
dominio_atributo(triangular, secao_caule).
dominio_atributo(achatado, secao_caule).
dominio_atributo(oco, secao_caule).

% ---------------------------------------------------
% COR DO CAULE / RAMO
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(verde_caule, cor_caule).
dominio_atributo(verde_avermelhado_caule, cor_caule).
dominio_atributo(marrom_claro_caule, cor_caule).
dominio_atributo(marrom_escuro_caule, cor_caule).
dominio_atributo(cinza_caule, cor_caule).
dominio_atributo(vermelho_caule, cor_caule).
dominio_atributo(preto_caule, cor_caule).
dominio_atributo(branco_caule, cor_caule).

% ---------------------------------------------------
% CAULES MODIFICADOS (ESTRUTURAS ESPECIALIZADAS)
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(rizoma, caule_modificado).
dominio_atributo(bulbo, caule_modificado).
dominio_atributo(bulbo_tunica, caule_modificado).
dominio_atributo(bulbo_escamoso, caule_modificado).
dominio_atributo(cormo, caule_modificado).
dominio_atributo(tuberculo, caule_modificado).
dominio_atributo(estolao, caule_modificado).
dominio_atributo(gavinha_caulinar, caule_modificado).
dominio_atributo(cladodio, caule_modificado).
dominio_atributo(sem_modificacao_caule, caule_modificado).

grupo_maior(X, caule) :- dominio_atributo(X, consistencia_caule); dominio_atributo(X, superficie_caule); dominio_atributo(X, secao_caule);
dominio_atributo(X, cor_caule); dominio_atributo(X, caule_modificado).

% =====================================================================
% RAIZES
% _____________________________________________________________________

% ---------------------------------------------------
% TIPO DE SISTEMA RADICULAR
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(pivotante, sistema_radicular).
dominio_atributo(fasciculado, sistema_radicular).
dominio_atributo(misto, sistema_radicular).

% ---------------------------------------------------
% RAÍZES MODIFICADAS
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(tuberosa, raiz_modificada).
dominio_atributo(aerea, raiz_modificada).
dominio_atributo(escora, raiz_modificada).
dominio_atributo(haustorial, raiz_modificada).
dominio_atributo(sem_modificacao_raiz, raiz_modificada).

grupo_maior(X, raiz) :- dominio_atributo(X, sistema_radicular); dominio_atributo(X, raiz_modificada).

% ========================================================================
% CARACTERISTICAS GERAIS DA PLANTA
% _________________________________________________________________________

% ---------------------------------------------------
% PORTE / ALTURA TÍPICA
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(miniatura, porte_planta).
dominio_atributo(rasteira, porte_planta).
dominio_atributo(media, porte_planta).
dominio_atributo(alta, porte_planta).
dominio_atributo(arbustiva, porte_planta).
dominio_atributo(arborea, porte_planta).

% ---------------------------------------------------
% CICLO DE VIDA
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(anual, ciclo_vida).
dominio_atributo(bienal, ciclo_vida).
dominio_atributo(perene_sempre_verde, ciclo_vida).
dominio_atributo(perene_caduca, ciclo_vida).
dominio_atributo(geofita, ciclo_vida).

% ---------------------------------------------------
% ÉPOCA DE FLORAÇÃO
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(primavera, epoca_floracao).
dominio_atributo(verao, epoca_floracao).
dominio_atributo(outono, epoca_floracao).
dominio_atributo(inverno, epoca_floracao).
dominio_atributo(floracao_longa, epoca_floracao).
dominio_atributo(reflorescente, epoca_floracao).
dominio_atributo(noturna, epoca_floracao).

% ---------------------------------------------------
% HABITAT / ORIGEM
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(temperado, habitat_origem).
dominio_atributo(mediterraneo, habitat_origem).
dominio_atributo(tropical, habitat_origem).
dominio_atributo(subtropical, habitat_origem).
dominio_atributo(alpino, habitat_origem).
dominio_atributo(aquatico, habitat_origem).
dominio_atributo(desertico, habitat_origem).
dominio_atributo(epifita, habitat_origem).

% ---------------------------------------------------
% TOXICIDADE
% Formato: dominio_atributo(Valor_Especifico, Nome_Do_Atributo)
% ---------------------------------------------------

dominio_atributo(nao_toxica, toxicidade).
dominio_atributo(toxica_para_animais, toxicidade).
dominio_atributo(toxica_para_humanos, toxicidade).
dominio_atributo(suco_irritante, toxicidade).
dominio_atributo(altamente_venenosa, toxicidade).

grupo_maior(X, caract_geral) :- dominio_atributo(X, porte_planta); dominio_atributo(X, ciclo_vida); dominio_atributo(X, epoca_floracao);
dominio_atributo(X, habitat_origem); dominio_atributo(X, toxicidade).