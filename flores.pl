% | BASE PROLOG |
:- encoding(utf8).
:- dynamic caracteristica/3.
:- dynamic subclasse_cor/2.
:- dynamic dominio_atributo/2.
:- discontiguous dominio_atributo/2.
:- discontiguous grupo_maior/2.

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
dominio_atributo(noturno_aroma, periodo_aroma).
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
dominio_atributo(noturna_floracao, epoca_floracao).

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

% ============================================================
% ESTRUTURA PRINCIPAL
% caracteristica(+NomeFlor, +Atributo, +Valor)
%
% Exemplos de uso:
%   ?- caracteristica(girassol, X, Y).          % tudo do girassol
%   ?- caracteristica(X, cor_petala, amarelo).  % flores amarelas
%   ?- caracteristica(X, cor_petala, Y).        % flores e suas cores
% ============================================================
% ------------------------------------------------------------
% GIRASSOL (Helianthus annuus)
% ------------------------------------------------------------
caracteristica(girassol, cor_petala,        amarelo_dourado).
caracteristica(girassol, formato_corola,    capitular).
caracteristica(girassol, numero_petalas,    treze_a_vinteuma).
caracteristica(girassol, forma_petala,      lanceolada_petala).
caracteristica(girassol, inflorescencia,    capitulo).
caracteristica(girassol, polinizacao,       abelhas).
caracteristica(girassol, polinizacao,       borboletas).
caracteristica(girassol, intensidade_aroma, suave).
caracteristica(girassol, porte_planta,      alta).
caracteristica(girassol, ciclo_vida,        anual).
caracteristica(girassol, epoca_floracao,    verao).
caracteristica(girassol, habitat_origem,    temperado).
caracteristica(girassol, consistencia_caule, herbaceo).
caracteristica(girassol, toxicidade,        nao_toxica).
caracteristica(girassol, formato_limbo,     oval).
caracteristica(girassol, margem_limbo,      dentada).
caracteristica(girassol, textura_folha,     rugosa).
caracteristica(girassol, simetria,          actinomorfa).
caracteristica(girassol, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% ROSA (Rosa spp.)
% ------------------------------------------------------------
caracteristica(rosa, cor_petala,        vermelho_cereja).
caracteristica(rosa, formato_corola,    rotacea).
caracteristica(rosa, disposicao_corola, dupla).
caracteristica(rosa, numero_petalas,    numerosas).
caracteristica(rosa, forma_petala,      arredondada).
caracteristica(rosa, textura_petala,    velutinosa).
caracteristica(rosa, inflorescencia,    flor_solitaria).
caracteristica(rosa, polinizacao,       abelhas).
caracteristica(rosa, polinizacao,       borboletas).
caracteristica(rosa, intensidade_aroma, intenso).
caracteristica(rosa, categoria_aroma,   floral_doce).
caracteristica(rosa, periodo_aroma,     diurno).
caracteristica(rosa, porte_planta,      arbustiva).
caracteristica(rosa, ciclo_vida,        perene_sempre_verde).
caracteristica(rosa, epoca_floracao,    reflorescente).
caracteristica(rosa, habitat_origem,    temperado).
caracteristica(rosa, consistencia_caule, lenhoso_arbusto).
caracteristica(rosa, superficie_caule,  aculeado).
caracteristica(rosa, toxicidade,        nao_toxica).
caracteristica(rosa, formato_limbo,     oval).
caracteristica(rosa, margem_limbo,      serrada).
caracteristica(rosa, simetria,          actinomorfa).
caracteristica(rosa, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% ORQUÍDEA PHALAENOPSIS (Phalaenopsis spp.)
% ------------------------------------------------------------
caracteristica(orquidea_phalaenopsis, cor_petala,        branco_puro).
caracteristica(orquidea_phalaenopsis, formato_corola,    bilabial).
caracteristica(orquidea_phalaenopsis, disposicao_corola, simples_disposicao).
caracteristica(orquidea_phalaenopsis, numero_petalas,    seis).
caracteristica(orquidea_phalaenopsis, forma_petala,      arredondada).
caracteristica(orquidea_phalaenopsis, textura_petala,    cerosa_petala).
caracteristica(orquidea_phalaenopsis, inflorescencia,    racemo).
caracteristica(orquidea_phalaenopsis, polinizacao,       abelhas).
caracteristica(orquidea_phalaenopsis, polinizacao,       mariposas).
caracteristica(orquidea_phalaenopsis, intensidade_aroma, suave).
caracteristica(orquidea_phalaenopsis, categoria_aroma,   floral_doce).
caracteristica(orquidea_phalaenopsis, porte_planta,      media).
caracteristica(orquidea_phalaenopsis, ciclo_vida,        perene_sempre_verde).
caracteristica(orquidea_phalaenopsis, epoca_floracao,    floracao_longa).
caracteristica(orquidea_phalaenopsis, habitat_origem,    epifita).
caracteristica(orquidea_phalaenopsis, consistencia_caule, herbaceo).
caracteristica(orquidea_phalaenopsis, toxicidade,        nao_toxica).
caracteristica(orquidea_phalaenopsis, formato_limbo,     oval).
caracteristica(orquidea_phalaenopsis, textura_folha,     lisa_brilhante).
caracteristica(orquidea_phalaenopsis, simetria,          zigomorfa).
caracteristica(orquidea_phalaenopsis, sexualidade_flor,  perfeita).
caracteristica(orquidea_phalaenopsis, merismo,           trimera).
% ------------------------------------------------------------
% LAVANDA (Lavandula angustifolia)
% ------------------------------------------------------------
caracteristica(lavanda, cor_petala,        lavanda).
caracteristica(lavanda, formato_corola,    tubular).
caracteristica(lavanda, disposicao_corola, simples_disposicao).
caracteristica(lavanda, numero_petalas,    cinco).
caracteristica(lavanda, forma_petala,      linear_petala).
caracteristica(lavanda, inflorescencia,    espiga).
caracteristica(lavanda, polinizacao,       abelhas).
caracteristica(lavanda, polinizacao,       borboletas).
caracteristica(lavanda, polinizacao,       mariposas).
caracteristica(lavanda, intensidade_aroma, muito_intenso).
caracteristica(lavanda, categoria_aroma,   floral_doce).
caracteristica(lavanda, periodo_aroma,     constante).
caracteristica(lavanda, porte_planta,      arbustiva).
caracteristica(lavanda, ciclo_vida,        perene_sempre_verde).
caracteristica(lavanda, epoca_floracao,    verao).
caracteristica(lavanda, habitat_origem,    mediterraneo).
caracteristica(lavanda, consistencia_caule, sublenhoso).
caracteristica(lavanda, toxicidade,        nao_toxica).
caracteristica(lavanda, formato_limbo,     linear_limbo).
caracteristica(lavanda, textura_folha,     tomentosa).
caracteristica(lavanda, simetria,          zigomorfa).
caracteristica(lavanda, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% TULIPA (Tulipa spp.)
% ------------------------------------------------------------
caracteristica(tulipa, cor_petala,        vermelho_escarlate).
caracteristica(tulipa, formato_corola,    campanulada).
caracteristica(tulipa, disposicao_corola, simples_disposicao).
caracteristica(tulipa, numero_petalas,    seis).
caracteristica(tulipa, forma_petala,      arredondada).
caracteristica(tulipa, textura_petala,    lisa).
caracteristica(tulipa, inflorescencia,    flor_solitaria).
caracteristica(tulipa, polinizacao,       abelhas).
caracteristica(tulipa, polinizacao,       vento).
caracteristica(tulipa, intensidade_aroma, inodora).
caracteristica(tulipa, porte_planta,      media).
caracteristica(tulipa, ciclo_vida,        geofita).
caracteristica(tulipa, epoca_floracao,    primavera).
caracteristica(tulipa, habitat_origem,    temperado).
caracteristica(tulipa, consistencia_caule, herbaceo).
caracteristica(tulipa, caule_modificado,  bulbo_tunica).
caracteristica(tulipa, toxicidade,        toxica_para_animais).
caracteristica(tulipa, formato_limbo,     lanceolada_limbo).
caracteristica(tulipa, textura_folha,     cerosa_folha).
caracteristica(tulipa, simetria,          actinomorfa).
caracteristica(tulipa, sexualidade_flor,  perfeita).
caracteristica(tulipa, merismo,           trimera).
% ------------------------------------------------------------
% MARGARIDA (Bellis perennis / Leucanthemum vulgare)
% ------------------------------------------------------------
caracteristica(margarida, cor_petala,        branco_puro).
caracteristica(margarida, formato_corola,    capitular).
caracteristica(margarida, disposicao_corola, simples_disposicao).
caracteristica(margarida, numero_petalas,    treze_a_vinteuma).
caracteristica(margarida, forma_petala,      lanceolada_petala).
caracteristica(margarida, inflorescencia,    capitulo).
caracteristica(margarida, polinizacao,       abelhas).
caracteristica(margarida, polinizacao,       borboletas).
caracteristica(margarida, intensidade_aroma, inodora).
caracteristica(margarida, porte_planta,      rasteira).
caracteristica(margarida, ciclo_vida,        perene_sempre_verde).
caracteristica(margarida, epoca_floracao,    primavera).
caracteristica(margarida, habitat_origem,    temperado).
caracteristica(margarida, consistencia_caule, herbaceo).
caracteristica(margarida, toxicidade,        nao_toxica).
caracteristica(margarida, formato_limbo,     espatulada_limbo).
caracteristica(margarida, margem_limbo,      crenada).
caracteristica(margarida, simetria,          actinomorfa).
caracteristica(margarida, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% LÍRIO (Lilium spp.)
% ------------------------------------------------------------
caracteristica(lirio, cor_petala,        branco_puro).
caracteristica(lirio, formato_corola,    infundibuliforme).
caracteristica(lirio, disposicao_corola, simples_disposicao).
caracteristica(lirio, numero_petalas,    seis).
caracteristica(lirio, forma_petala,      lanceolada_petala).
caracteristica(lirio, textura_petala,    lisa).
caracteristica(lirio, inflorescencia,    racemo).
caracteristica(lirio, polinizacao,       abelhas).
caracteristica(lirio, polinizacao,       mariposas).
caracteristica(lirio, intensidade_aroma, muito_intenso).
caracteristica(lirio, categoria_aroma,   floral_doce).
caracteristica(lirio, periodo_aroma,     diurno).
caracteristica(lirio, porte_planta,      alta).
caracteristica(lirio, ciclo_vida,        geofita).
caracteristica(lirio, epoca_floracao,    verao).
caracteristica(lirio, habitat_origem,    temperado).
caracteristica(lirio, consistencia_caule, herbaceo).
caracteristica(lirio, caule_modificado,  bulbo_escamoso).
caracteristica(lirio, toxicidade,        toxica_para_animais).
caracteristica(lirio, formato_limbo,     lanceolada_limbo).
caracteristica(lirio, textura_folha,     lisa_brilhante).
caracteristica(lirio, simetria,          actinomorfa).
caracteristica(lirio, sexualidade_flor,  perfeita).
caracteristica(lirio, merismo,           trimera).
% ------------------------------------------------------------
% VIOLETA (Viola odorata)
% ------------------------------------------------------------
caracteristica(violeta, cor_petala,        violeta_medio).
caracteristica(violeta, formato_corola,    zigomorfa).
caracteristica(violeta, disposicao_corola, simples_disposicao).
caracteristica(violeta, numero_petalas,    cinco).
caracteristica(violeta, forma_petala,      arredondada).
caracteristica(violeta, textura_petala,    velutinosa).
caracteristica(violeta, inflorescencia,    flor_solitaria).
caracteristica(violeta, polinizacao,       abelhas).
caracteristica(violeta, intensidade_aroma, intenso).
caracteristica(violeta, categoria_aroma,   floral_doce).
caracteristica(violeta, periodo_aroma,     diurno).
caracteristica(violeta, porte_planta,      rasteira).
caracteristica(violeta, ciclo_vida,        perene_sempre_verde).
caracteristica(violeta, epoca_floracao,    primavera).
caracteristica(violeta, habitat_origem,    temperado).
caracteristica(violeta, consistencia_caule, herbaceo).
caracteristica(violeta, toxicidade,        nao_toxica).
caracteristica(violeta, formato_limbo,     cordada).
caracteristica(violeta, margem_limbo,      crenada).
caracteristica(violeta, simetria,          zigomorfa).
caracteristica(violeta, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% CRISÂNTEMO (Chrysanthemum morifolium)
% ------------------------------------------------------------
caracteristica(crisantemo, cor_petala,        amarelo_dourado).
caracteristica(crisantemo, formato_corola,    capitular).
caracteristica(crisantemo, disposicao_corola, dupla).
caracteristica(crisantemo, numero_petalas,    numerosas).
caracteristica(crisantemo, forma_petala,      linear_petala).
caracteristica(crisantemo, inflorescencia,    capitulo).
caracteristica(crisantemo, polinizacao,       abelhas).
caracteristica(crisantemo, polinizacao,       borboletas).
caracteristica(crisantemo, intensidade_aroma, moderado).
caracteristica(crisantemo, categoria_aroma,   especiado).
caracteristica(crisantemo, porte_planta,      arbustiva).
caracteristica(crisantemo, ciclo_vida,        perene_sempre_verde).
caracteristica(crisantemo, epoca_floracao,    outono).
caracteristica(crisantemo, habitat_origem,    temperado).
caracteristica(crisantemo, consistencia_caule, herbaceo).
caracteristica(crisantemo, toxicidade,        toxica_para_animais).
caracteristica(crisantemo, formato_limbo,     lobada).
caracteristica(crisantemo, margem_limbo,      dentada).
caracteristica(crisantemo, textura_folha,     pubescente).
caracteristica(crisantemo, simetria,          actinomorfa).
caracteristica(crisantemo, sexualidade_flor,  perfeita).
% ------------------------------------------------------------
% ANTÚRIO (Anthurium andraeanum)
% ------------------------------------------------------------
caracteristica(anthurio, cor_petala,        vermelho_escarlate).
caracteristica(anthurio, formato_corola,    em_espata).
caracteristica(anthurio, disposicao_corola, simples_disposicao).
caracteristica(anthurio, numero_petalas,    uma).
caracteristica(anthurio, textura_petala,    cerosa_petala).
caracteristica(anthurio, inflorescencia,    espata_espadice).
caracteristica(anthurio, polinizacao,       besouros).
caracteristica(anthurio, polinizacao,       moscas).
caracteristica(anthurio, intensidade_aroma, inodora).
caracteristica(anthurio, porte_planta,      media).
caracteristica(anthurio, ciclo_vida,        perene_sempre_verde).
caracteristica(anthurio, epoca_floracao,    floracao_longa).
caracteristica(anthurio, habitat_origem,    tropical).
caracteristica(anthurio, consistencia_caule, herbaceo).
caracteristica(anthurio, toxicidade,        toxica_para_humanos).
caracteristica(anthurio, formato_limbo,     cordada).
caracteristica(anthurio, textura_folha,     lisa_brilhante).
caracteristica(anthurio, simetria,          actinomorfa).
caracteristica(anthurio, sexualidade_flor,  perfeita).

% ------------------------------------------------------------
% JASMIM (Jasminum officinale)
% ------------------------------------------------------------
caracteristica(jasmim, cor_petala,         branco_puro).
caracteristica(jasmim, formato_corola,     estrelada).
caracteristica(jasmim, disposicao_corola,  simples_disposicao).
caracteristica(jasmim, numero_petalas,     cinco).
caracteristica(jasmim, forma_petala,       arredondada).
caracteristica(jasmim, textura_petala,     lisa).
caracteristica(jasmim, inflorescencia,     cimeira).
caracteristica(jasmim, polinizacao,        mariposas).
caracteristica(jasmim, polinizacao,        abelhas).
caracteristica(jasmim, intensidade_aroma,  muito_intenso).
caracteristica(jasmim, categoria_aroma,    floral_doce).
caracteristica(jasmim, periodo_aroma,      noturno_aroma).
caracteristica(jasmim, porte_planta,       arbustiva).
caracteristica(jasmim, ciclo_vida,         perene_sempre_verde).
caracteristica(jasmim, epoca_floracao,     verao).
caracteristica(jasmim, habitat_origem,     temperado).
caracteristica(jasmim, consistencia_caule, lenhoso_arbusto).
caracteristica(jasmim, toxicidade,         nao_toxica).
caracteristica(jasmim, formato_limbo,      oval).
caracteristica(jasmim, margem_limbo,       inteira).
caracteristica(jasmim, textura_folha,      lisa_brilhante).
caracteristica(jasmim, simetria,           actinomorfa).
caracteristica(jasmim, sexualidade_flor,   perfeita).
caracteristica(jasmim, merismo,            pentamera).
 
% ------------------------------------------------------------
% GÉRBERA (Gerbera jamesonii)
% ------------------------------------------------------------
caracteristica(gerbera, cor_petala,         laranja_vivo).
caracteristica(gerbera, formato_corola,     capitular).
caracteristica(gerbera, disposicao_corola,  simples_disposicao).
caracteristica(gerbera, numero_petalas,     treze_a_vinteuma).
caracteristica(gerbera, forma_petala,       lanceolada_petala).
caracteristica(gerbera, textura_petala,     lisa).
caracteristica(gerbera, inflorescencia,     capitulo).
caracteristica(gerbera, polinizacao,        abelhas).
caracteristica(gerbera, polinizacao,        borboletas).
caracteristica(gerbera, intensidade_aroma,  inodora).
caracteristica(gerbera, porte_planta,       media).
caracteristica(gerbera, ciclo_vida,         perene_sempre_verde).
caracteristica(gerbera, epoca_floracao,     floracao_longa).
caracteristica(gerbera, habitat_origem,     subtropical).
caracteristica(gerbera, consistencia_caule, herbaceo).
caracteristica(gerbera, toxicidade,         nao_toxica).
caracteristica(gerbera, formato_limbo,      lobada).
caracteristica(gerbera, margem_limbo,       dentada).
caracteristica(gerbera, textura_folha,      pubescente).
caracteristica(gerbera, simetria,           actinomorfa).
caracteristica(gerbera, sexualidade_flor,   perfeita).
 
% ------------------------------------------------------------
% BEGÔNIA (Begonia × hiemalis)
% ------------------------------------------------------------
caracteristica(begonia, cor_petala,         rosa_coral).
caracteristica(begonia, formato_corola,     rotacea).
caracteristica(begonia, disposicao_corola,  dupla).
caracteristica(begonia, numero_petalas,     quatro).
caracteristica(begonia, forma_petala,       arredondada).
caracteristica(begonia, textura_petala,     cerosa_petala).
caracteristica(begonia, inflorescencia,     cimeira).
caracteristica(begonia, polinizacao,        abelhas).
caracteristica(begonia, polinizacao,        besouros).
caracteristica(begonia, intensidade_aroma,  inodora).
caracteristica(begonia, porte_planta,       rasteira).
caracteristica(begonia, ciclo_vida,         perene_sempre_verde).
caracteristica(begonia, epoca_floracao,     floracao_longa).
caracteristica(begonia, habitat_origem,     tropical).
caracteristica(begonia, consistencia_caule, herbaceo).
caracteristica(begonia, toxicidade,         toxica_para_animais).
caracteristica(begonia, formato_limbo,      cordada).
caracteristica(begonia, margem_limbo,       serrada).
caracteristica(begonia, textura_folha,      lisa_brilhante).
caracteristica(begonia, simetria,           zigomorfa).
caracteristica(begonia, sexualidade_flor,   imperfeita_pistilada).
caracteristica(begonia, sexo_planta,        monoica).
caracteristica(begonia, merismo,            tetramera).
 
% ------------------------------------------------------------
% DÁLIA (Dahlia pinnata)
% ------------------------------------------------------------
caracteristica(dalia, cor_petala,         vermelho_carmim).
caracteristica(dalia, formato_corola,     capitular).
caracteristica(dalia, disposicao_corola,  dupla).
caracteristica(dalia, numero_petalas,     numerosas).
caracteristica(dalia, forma_petala,       lanceolada_petala).
caracteristica(dalia, textura_petala,     lisa).
caracteristica(dalia, inflorescencia,     capitulo).
caracteristica(dalia, polinizacao,        abelhas).
caracteristica(dalia, polinizacao,        borboletas).
caracteristica(dalia, intensidade_aroma,  inodora).
caracteristica(dalia, porte_planta,       alta).
caracteristica(dalia, ciclo_vida,         geofita).
caracteristica(dalia, epoca_floracao,     verao).
caracteristica(dalia, habitat_origem,     subtropical).
caracteristica(dalia, consistencia_caule, herbaceo).
caracteristica(dalia, caule_modificado,   tuberculo).
caracteristica(dalia, toxicidade,         nao_toxica).
caracteristica(dalia, formato_limbo,      composta_imparipinada).
caracteristica(dalia, margem_limbo,       dentada).
caracteristica(dalia, textura_folha,      lisa_opaca).
caracteristica(dalia, simetria,           actinomorfa).
caracteristica(dalia, sexualidade_flor,   perfeita).
 
% ------------------------------------------------------------
% HIBISCO (Hibiscus rosa-sinensis)
% ------------------------------------------------------------
caracteristica(hibisco, cor_petala,         vermelho_escarlate).
caracteristica(hibisco, formato_corola,     infundibuliforme).
caracteristica(hibisco, disposicao_corola,  simples_disposicao).
caracteristica(hibisco, numero_petalas,     cinco).
caracteristica(hibisco, forma_petala,       arredondada).
caracteristica(hibisco, textura_petala,     lisa).
caracteristica(hibisco, inflorescencia,     flor_solitaria).
caracteristica(hibisco, polinizacao,        passaros).
caracteristica(hibisco, polinizacao,        abelhas).
caracteristica(hibisco, intensidade_aroma,  inodora).
caracteristica(hibisco, porte_planta,       arbustiva).
caracteristica(hibisco, ciclo_vida,         perene_sempre_verde).
caracteristica(hibisco, epoca_floracao,     floracao_longa).
caracteristica(hibisco, habitat_origem,     tropical).
caracteristica(hibisco, consistencia_caule, lenhoso_arbusto).
caracteristica(hibisco, toxicidade,         nao_toxica).
caracteristica(hibisco, formato_limbo,      oval).
caracteristica(hibisco, margem_limbo,       serrada).
caracteristica(hibisco, textura_folha,      lisa_brilhante).
caracteristica(hibisco, simetria,           actinomorfa).
caracteristica(hibisco, sexualidade_flor,   perfeita).
caracteristica(hibisco, merismo,            pentamera).
 
% ------------------------------------------------------------
% CALÊNDULA (Calendula officinalis)
% ------------------------------------------------------------
caracteristica(calendula, cor_petala,         laranja_vivo).
caracteristica(calendula, formato_corola,     capitular).
caracteristica(calendula, disposicao_corola,  simples_disposicao).
caracteristica(calendula, numero_petalas,     treze_a_vinteuma).
caracteristica(calendula, forma_petala,       lanceolada_petala).
caracteristica(calendula, textura_petala,     lisa).
caracteristica(calendula, inflorescencia,     capitulo).
caracteristica(calendula, polinizacao,        abelhas).
caracteristica(calendula, polinizacao,        borboletas).
caracteristica(calendula, intensidade_aroma,  moderado).
caracteristica(calendula, categoria_aroma,    especiado).
caracteristica(calendula, periodo_aroma,      diurno).
caracteristica(calendula, porte_planta,       media).
caracteristica(calendula, ciclo_vida,         anual).
caracteristica(calendula, epoca_floracao,     primavera).
caracteristica(calendula, habitat_origem,     mediterraneo).
caracteristica(calendula, consistencia_caule, herbaceo).
caracteristica(calendula, toxicidade,         nao_toxica).
caracteristica(calendula, formato_limbo,      espatulada_limbo).
caracteristica(calendula, margem_limbo,       inteira).
caracteristica(calendula, textura_folha,      pubescente).
caracteristica(calendula, simetria,           actinomorfa).
caracteristica(calendula, sexualidade_flor,   perfeita).
 
% ------------------------------------------------------------
% ÍRIS (Iris germanica)
% ------------------------------------------------------------
caracteristica(iris, cor_petala,         violeta_intenso).
caracteristica(iris, formato_corola,     zigomorfa).
caracteristica(iris, disposicao_corola,  simples_disposicao).
caracteristica(iris, numero_petalas,     seis).
caracteristica(iris, forma_petala,       ondulada_petala).
caracteristica(iris, textura_petala,     velutinosa).
caracteristica(iris, inflorescencia,     racemo).
caracteristica(iris, polinizacao,        abelhas).
caracteristica(iris, polinizacao,        borboletas).
caracteristica(iris, intensidade_aroma,  moderado).
caracteristica(iris, categoria_aroma,    floral_doce).
caracteristica(iris, periodo_aroma,      diurno).
caracteristica(iris, porte_planta,       media).
caracteristica(iris, ciclo_vida,         geofita).
caracteristica(iris, epoca_floracao,     primavera).
caracteristica(iris, habitat_origem,     temperado).
caracteristica(iris, consistencia_caule, herbaceo).
caracteristica(iris, caule_modificado,   rizoma).
caracteristica(iris, toxicidade,         toxica_para_animais).
caracteristica(iris, formato_limbo,      linear_limbo).
caracteristica(iris, margem_limbo,       inteira).
caracteristica(iris, textura_folha,      lisa_opaca).
caracteristica(iris, simetria,           zigomorfa).
caracteristica(iris, sexualidade_flor,   perfeita).
caracteristica(iris, merismo,            trimera).
 
% ------------------------------------------------------------
% HELICÔNIA (Heliconia psittacorum)
% ------------------------------------------------------------
caracteristica(heliconia, cor_petala,         laranja_vivo).
caracteristica(heliconia, formato_corola,     tubular).
caracteristica(heliconia, disposicao_corola,  simples_disposicao).
caracteristica(heliconia, numero_petalas,     tres).
caracteristica(heliconia, forma_petala,       lanceolada_petala).
caracteristica(heliconia, textura_petala,     cerosa_petala).
caracteristica(heliconia, inflorescencia,     espata_espadice).
caracteristica(heliconia, polinizacao,        passaros).
caracteristica(heliconia, intensidade_aroma,  inodora).
caracteristica(heliconia, porte_planta,       alta).
caracteristica(heliconia, ciclo_vida,         perene_sempre_verde).
caracteristica(heliconia, epoca_floracao,     floracao_longa).
caracteristica(heliconia, habitat_origem,     tropical).
caracteristica(heliconia, consistencia_caule, herbaceo).
caracteristica(heliconia, caule_modificado,   rizoma).
caracteristica(heliconia, toxicidade,         nao_toxica).
caracteristica(heliconia, formato_limbo,      oval).
caracteristica(heliconia, margem_limbo,       inteira).
caracteristica(heliconia, textura_folha,      lisa_brilhante).
caracteristica(heliconia, simetria,           zigomorfa).
caracteristica(heliconia, sexualidade_flor,   perfeita).
caracteristica(heliconia, merismo,            trimera).

% ------------------------------------------------------------
% PETÚNIA (Petunia × hybrida)
% ------------------------------------------------------------
caracteristica(petunia, cor_petala,         rosa_fucsia).
caracteristica(petunia, formato_corola,     infundibuliforme).
caracteristica(petunia, disposicao_corola,  simples_disposicao).
caracteristica(petunia, numero_petalas,     cinco).
caracteristica(petunia, forma_petala,       ondulada_petala).
caracteristica(petunia, textura_petala,     velutinosa).
caracteristica(petunia, inflorescencia,     flor_solitaria).
caracteristica(petunia, polinizacao,        mariposas).
caracteristica(petunia, polinizacao,        abelhas).
caracteristica(petunia, intensidade_aroma,  suave).
caracteristica(petunia, categoria_aroma,    floral_doce).
caracteristica(petunia, periodo_aroma,      noturno_aroma).
caracteristica(petunia, porte_planta,       rasteira).
caracteristica(petunia, ciclo_vida,         anual).
caracteristica(petunia, epoca_floracao,     floracao_longa).
caracteristica(petunia, habitat_origem,     subtropical).
caracteristica(petunia, consistencia_caule, herbaceo).
caracteristica(petunia, superficie_caule,   piloso).
caracteristica(petunia, toxicidade,         nao_toxica).
caracteristica(petunia, formato_limbo,      oval).
caracteristica(petunia, margem_limbo,       inteira).
caracteristica(petunia, textura_folha,      viscosa).
caracteristica(petunia, simetria,           actinomorfa).
caracteristica(petunia, sexualidade_flor,   perfeita).
caracteristica(petunia, merismo,            pentamera).
 
% ------------------------------------------------------------
% BOUGAINVILLEA / PRIMAVERA (Bougainvillea spectabilis)
% ------------------------------------------------------------
caracteristica(primavera, cor_petala,         rosa_magenta).
caracteristica(primavera, formato_corola,     tubular).
caracteristica(primavera, disposicao_corola,  simples_disposicao).
caracteristica(primavera, numero_petalas,     tres).
caracteristica(primavera, forma_petala,       lanceolada_petala).
caracteristica(primavera, textura_petala,     papilosa).
caracteristica(primavera, inflorescencia,     cimeira).
caracteristica(primavera, polinizacao,        passaros).
caracteristica(primavera, polinizacao,        abelhas).
caracteristica(primavera, intensidade_aroma,  inodora).
caracteristica(primavera, porte_planta,       arbustiva).
caracteristica(primavera, ciclo_vida,         perene_sempre_verde).
caracteristica(primavera, epoca_floracao,     floracao_longa).
caracteristica(primavera, habitat_origem,     tropical).
caracteristica(primavera, consistencia_caule, lenhoso_arbusto).
caracteristica(primavera, superficie_caule,   espinhoso).
caracteristica(primavera, folha_modificada,   bractea).
caracteristica(primavera, toxicidade,         suco_irritante).
caracteristica(primavera, formato_limbo,      oval).
caracteristica(primavera, margem_limbo,       inteira).
caracteristica(primavera, textura_folha,      pubescente).
caracteristica(primavera, simetria,           actinomorfa).
caracteristica(primavera, sexualidade_flor,   perfeita).
 
% ------------------------------------------------------------
% ZÍNIA (Zinnia elegans)
% ------------------------------------------------------------
caracteristica(zinia, cor_petala,         vermelho_escarlate).
caracteristica(zinia, formato_corola,     capitular).
caracteristica(zinia, disposicao_corola,  dupla).
caracteristica(zinia, numero_petalas,     oito_a_doze).
caracteristica(zinia, forma_petala,       espatulada_petala).
caracteristica(zinia, textura_petala,     lisa).
caracteristica(zinia, inflorescencia,     capitulo).
caracteristica(zinia, polinizacao,        borboletas).
caracteristica(zinia, polinizacao,        abelhas).
caracteristica(zinia, intensidade_aroma,  inodora).
caracteristica(zinia, porte_planta,       media).
caracteristica(zinia, ciclo_vida,         anual).
caracteristica(zinia, epoca_floracao,     verao).
caracteristica(zinia, habitat_origem,     subtropical).
caracteristica(zinia, consistencia_caule, herbaceo).
caracteristica(zinia, superficie_caule,   piloso).
caracteristica(zinia, toxicidade,         nao_toxica).
caracteristica(zinia, formato_limbo,      oval).
caracteristica(zinia, margem_limbo,       inteira).
caracteristica(zinia, textura_folha,      rugosa).
caracteristica(zinia, simetria,           actinomorfa).
caracteristica(zinia, sexualidade_flor,   perfeita).
 
% ------------------------------------------------------------
% MAGNÓLIA (Magnolia grandiflora)
% ------------------------------------------------------------
caracteristica(magnolia, cor_petala,         branco_creme).
caracteristica(magnolia, formato_corola,     rotacea).
caracteristica(magnolia, disposicao_corola,  simples_disposicao).
caracteristica(magnolia, numero_petalas,     seis).
caracteristica(magnolia, forma_petala,       arredondada).
caracteristica(magnolia, textura_petala,     cerosa_petala).
caracteristica(magnolia, inflorescencia,     flor_solitaria).
caracteristica(magnolia, polinizacao,        besouros).
caracteristica(magnolia, intensidade_aroma,  muito_intenso).
caracteristica(magnolia, categoria_aroma,    floral_doce).
caracteristica(magnolia, periodo_aroma,      diurno).
caracteristica(magnolia, porte_planta,       arborea).
caracteristica(magnolia, ciclo_vida,         perene_sempre_verde).
caracteristica(magnolia, epoca_floracao,     primavera).
caracteristica(magnolia, habitat_origem,     temperado).
caracteristica(magnolia, consistencia_caule, lenhoso_arvore).
caracteristica(magnolia, toxicidade,         nao_toxica).
caracteristica(magnolia, formato_limbo,      eliptica).
caracteristica(magnolia, margem_limbo,       inteira).
caracteristica(magnolia, textura_folha,      lisa_brilhante).
caracteristica(magnolia, simetria,           actinomorfa).
caracteristica(magnolia, sexualidade_flor,   perfeita).
caracteristica(magnolia, merismo,            trimera).
 
% ------------------------------------------------------------
% PAPOULA (Papaver rhoeas)
% ------------------------------------------------------------
caracteristica(papoula, cor_petala,         vermelho_escarlate).
caracteristica(papoula, formato_corola,     rotacea).
caracteristica(papoula, disposicao_corola,  simples_disposicao).
caracteristica(papoula, numero_petalas,     quatro).
caracteristica(papoula, forma_petala,       arredondada).
caracteristica(papoula, textura_petala,     translucida).
caracteristica(papoula, inflorescencia,     flor_solitaria).
caracteristica(papoula, polinizacao,        abelhas).
caracteristica(papoula, polinizacao,        besouros).
caracteristica(papoula, intensidade_aroma,  inodora).
caracteristica(papoula, porte_planta,       media).
caracteristica(papoula, ciclo_vida,         anual).
caracteristica(papoula, epoca_floracao,     primavera).
caracteristica(papoula, habitat_origem,     mediterraneo).
caracteristica(papoula, consistencia_caule, herbaceo).
caracteristica(papoula, superficie_caule,   piloso).
caracteristica(papoula, toxicidade,         altamente_venenosa).
caracteristica(papoula, formato_limbo,      penatilobada).
caracteristica(papoula, margem_limbo,       serrada).
caracteristica(papoula, textura_folha,      pubescente).
caracteristica(papoula, simetria,           actinomorfa).
caracteristica(papoula, sexualidade_flor,   perfeita).
caracteristica(papoula, merismo,            tetramera).
 
% ------------------------------------------------------------
% FLOR-DE-LIS / AGAPANTO (Agapanthus africanus)
% ------------------------------------------------------------
caracteristica(agapanto, cor_petala,         azul_medio).
caracteristica(agapanto, formato_corola,     infundibuliforme).
caracteristica(agapanto, disposicao_corola,  simples_disposicao).
caracteristica(agapanto, numero_petalas,     seis).
caracteristica(agapanto, forma_petala,       lanceolada_petala).
caracteristica(agapanto, textura_petala,     lisa).
caracteristica(agapanto, inflorescencia,     umbela).
caracteristica(agapanto, polinizacao,        abelhas).
caracteristica(agapanto, polinizacao,        passaros).
caracteristica(agapanto, intensidade_aroma,  suave).
caracteristica(agapanto, categoria_aroma,    floral_doce).
caracteristica(agapanto, porte_planta,       media).
caracteristica(agapanto, ciclo_vida,         perene_sempre_verde).
caracteristica(agapanto, epoca_floracao,     verao).
caracteristica(agapanto, habitat_origem,     subtropical).
caracteristica(agapanto, consistencia_caule, herbaceo).
caracteristica(agapanto, caule_modificado,   rizoma).
caracteristica(agapanto, toxicidade,         toxica_para_animais).
caracteristica(agapanto, formato_limbo,      linear_limbo).
caracteristica(agapanto, margem_limbo,       inteira).
caracteristica(agapanto, textura_folha,      lisa_brilhante).
caracteristica(agapanto, simetria,           actinomorfa).
caracteristica(agapanto, sexualidade_flor,   perfeita).
caracteristica(agapanto, merismo,            trimera).
 
% ------------------------------------------------------------
% AMOR-PERFEITO (Viola × wittrockiana)
% ------------------------------------------------------------
caracteristica(amor_perfeito, cor_petala,         com_olho_central).
caracteristica(amor_perfeito, formato_corola,     rotacea).
caracteristica(amor_perfeito, disposicao_corola,  simples_disposicao).
caracteristica(amor_perfeito, numero_petalas,     cinco).
caracteristica(amor_perfeito, forma_petala,       arredondada).
caracteristica(amor_perfeito, textura_petala,     velutinosa).
caracteristica(amor_perfeito, inflorescencia,     flor_solitaria).
caracteristica(amor_perfeito, polinizacao,        abelhas).
caracteristica(amor_perfeito, polinizacao,        borboletas).
caracteristica(amor_perfeito, intensidade_aroma,  suave).
caracteristica(amor_perfeito, categoria_aroma,    floral_doce).
caracteristica(amor_perfeito, porte_planta,       rasteira).
caracteristica(amor_perfeito, ciclo_vida,         anual).
caracteristica(amor_perfeito, epoca_floracao,     inverno).
caracteristica(amor_perfeito, habitat_origem,     temperado).
caracteristica(amor_perfeito, consistencia_caule, herbaceo).
caracteristica(amor_perfeito, toxicidade,         nao_toxica).
caracteristica(amor_perfeito, formato_limbo,      oval).
caracteristica(amor_perfeito, margem_limbo,       crenada).
caracteristica(amor_perfeito, textura_folha,      lisa_opaca).
caracteristica(amor_perfeito, simetria,           zigomorfa).
caracteristica(amor_perfeito, sexualidade_flor,   perfeita).
caracteristica(amor_perfeito, merismo,            pentamera).
 
% ------------------------------------------------------------
% COPO-DE-LEITE (Zantedeschia aethiopica)
% ------------------------------------------------------------
caracteristica(copo_de_leite, cor_petala,         branco_puro).
caracteristica(copo_de_leite, formato_corola,     em_espata).
caracteristica(copo_de_leite, disposicao_corola,  simples_disposicao).
caracteristica(copo_de_leite, numero_petalas,     uma).
caracteristica(copo_de_leite, textura_petala,     cerosa_petala).
caracteristica(copo_de_leite, inflorescencia,     espata_espadice).
caracteristica(copo_de_leite, polinizacao,        besouros).
caracteristica(copo_de_leite, polinizacao,        moscas).
caracteristica(copo_de_leite, intensidade_aroma,  suave).
caracteristica(copo_de_leite, categoria_aroma,    floral_doce).
caracteristica(copo_de_leite, porte_planta,       media).
caracteristica(copo_de_leite, ciclo_vida,         geofita).
caracteristica(copo_de_leite, epoca_floracao,     primavera).
caracteristica(copo_de_leite, habitat_origem,     subtropical).
caracteristica(copo_de_leite, consistencia_caule, herbaceo).
caracteristica(copo_de_leite, caule_modificado,   rizoma).
caracteristica(copo_de_leite, toxicidade,         toxica_para_humanos).
caracteristica(copo_de_leite, formato_limbo,      sagitada).
caracteristica(copo_de_leite, margem_limbo,       inteira).
caracteristica(copo_de_leite, textura_folha,      lisa_brilhante).
caracteristica(copo_de_leite, simetria,           assimetrica).
caracteristica(copo_de_leite, sexualidade_flor,   imperfeita_pistilada).
caracteristica(copo_de_leite, sexo_planta,        monoica).
 
% ------------------------------------------------------------
% DELFÍNIO (Delphinium elatum)
% ------------------------------------------------------------
caracteristica(delfinio, cor_petala,         azul_cobalto).
caracteristica(delfinio, formato_corola,     zigomorfa).
caracteristica(delfinio, disposicao_corola,  simples_disposicao).
caracteristica(delfinio, numero_petalas,     cinco).
caracteristica(delfinio, forma_petala,       arredondada).
caracteristica(delfinio, textura_petala,     lisa).
caracteristica(delfinio, inflorescencia,     racemo).
caracteristica(delfinio, polinizacao,        abelhas).
caracteristica(delfinio, polinizacao,        mariposas).
caracteristica(delfinio, intensidade_aroma,  inodora).
caracteristica(delfinio, porte_planta,       alta).
caracteristica(delfinio, ciclo_vida,         perene_sempre_verde).
caracteristica(delfinio, epoca_floracao,     verao).
caracteristica(delfinio, habitat_origem,     temperado).
caracteristica(delfinio, consistencia_caule, herbaceo).
caracteristica(delfinio, toxicidade,         altamente_venenosa).
caracteristica(delfinio, formato_limbo,      palmatilobada).
caracteristica(delfinio, margem_limbo,       dentada).
caracteristica(delfinio, textura_folha,      lisa_opaca).
caracteristica(delfinio, simetria,           zigomorfa).
caracteristica(delfinio, sexualidade_flor,   perfeita).
caracteristica(delfinio, merismo,            pentamera).
 
% ------------------------------------------------------------
% AMARÍLIS (Hippeastrum hybridum)
% ------------------------------------------------------------
caracteristica(amarilis, cor_petala,         vermelho_escarlate).
caracteristica(amarilis, formato_corola,     infundibuliforme).
caracteristica(amarilis, disposicao_corola,  simples_disposicao).
caracteristica(amarilis, numero_petalas,     seis).
caracteristica(amarilis, forma_petala,       arredondada).
caracteristica(amarilis, textura_petala,     lisa).
caracteristica(amarilis, inflorescencia,     umbela).
caracteristica(amarilis, polinizacao,        passaros).
caracteristica(amarilis, polinizacao,        abelhas).
caracteristica(amarilis, intensidade_aroma,  inodora).
caracteristica(amarilis, porte_planta,       media).
caracteristica(amarilis, ciclo_vida,         geofita).
caracteristica(amarilis, epoca_floracao,     inverno).
caracteristica(amarilis, habitat_origem,     subtropical).
caracteristica(amarilis, consistencia_caule, herbaceo).
caracteristica(amarilis, caule_modificado,   bulbo_tunica).
caracteristica(amarilis, toxicidade,         toxica_para_animais).
caracteristica(amarilis, formato_limbo,      linear_limbo).
caracteristica(amarilis, margem_limbo,       inteira).
caracteristica(amarilis, textura_folha,      lisa_brilhante).
caracteristica(amarilis, simetria,           actinomorfa).
caracteristica(amarilis, sexualidade_flor,   perfeita).
caracteristica(amarilis, merismo,            trimera).

% ------------------------------------------------------------
% LAVANDA (Lavandula angustifolia)
% ------------------------------------------------------------
caracteristica(lavanda, cor_petala,         violeta_claro).
caracteristica(lavanda, formato_corola,     tubular).
caracteristica(lavanda, disposicao_corola,  simples_disposicao).
caracteristica(lavanda, numero_petalas,     cinco).
caracteristica(lavanda, forma_petala,       lanceolada_petala).
caracteristica(lavanda, textura_petala,     velutinosa).
caracteristica(lavanda, inflorescencia,     espiga).
caracteristica(lavanda, polinizacao,        abelhas).
caracteristica(lavanda, polinizacao,        borboletas).
caracteristica(lavanda, intensidade_aroma,  muito_intenso).
caracteristica(lavanda, categoria_aroma,    herbal_aromatico).
caracteristica(lavanda, periodo_aroma,      diurno).
caracteristica(lavanda, porte_planta,       arbustiva).
caracteristica(lavanda, ciclo_vida,         perene_sempre_verde).
caracteristica(lavanda, epoca_floracao,     verao).
caracteristica(lavanda, habitat_origem,     mediterraneo).
caracteristica(lavanda, consistencia_caule, sublenhoso).
caracteristica(lavanda, superficie_caule,   piloso).
caracteristica(lavanda, secao_caule,        quadrangular).
caracteristica(lavanda, toxicidade,         nao_toxica).
caracteristica(lavanda, formato_limbo,      linear_limbo).
caracteristica(lavanda, margem_limbo,       inteira).
caracteristica(lavanda, textura_folha,      pubescente).
caracteristica(lavanda, simetria,           zigomorfa).
caracteristica(lavanda, sexualidade_flor,   perfeita).
caracteristica(lavanda, merismo,            pentamera).
 
% ------------------------------------------------------------
% ANTÚRIO (Anthurium andraeanum)
% ------------------------------------------------------------
caracteristica(anthurio, cor_petala,         vermelho_escarlate).
caracteristica(anthurio, formato_corola,     em_espata).
caracteristica(anthurio, disposicao_corola,  simples_disposicao).
caracteristica(anthurio, numero_petalas,     uma).
caracteristica(anthurio, textura_petala,     cerosa_petala).
caracteristica(anthurio, inflorescencia,     espata_espadice).
caracteristica(anthurio, polinizacao,        abelhas).
caracteristica(anthurio, polinizacao,        moscas).
caracteristica(anthurio, intensidade_aroma,  inodora).
caracteristica(anthurio, porte_planta,       media).
caracteristica(anthurio, ciclo_vida,         perene_sempre_verde).
caracteristica(anthurio, epoca_floracao,     floracao_longa).
caracteristica(anthurio, habitat_origem,     tropical).
caracteristica(anthurio, consistencia_caule, herbaceo).
caracteristica(anthurio, caule_modificado,   rizoma).
caracteristica(anthurio, raiz_modificada,    aerea).
caracteristica(anthurio, toxicidade,         toxica_para_humanos).
caracteristica(anthurio, formato_limbo,      cordada).
caracteristica(anthurio, margem_limbo,       inteira).
caracteristica(anthurio, textura_folha,      lisa_brilhante).
caracteristica(anthurio, simetria,           assimetrica).
caracteristica(anthurio, sexualidade_flor,   perfeita).
caracteristica(anthurio, sexo_planta,        monoica).



% ============================================================
% REGRAS AUXILIARES DE CONSULTA
% ============================================================

% flores_com/2 — lista todas as flores que possuem um par atributo/valor
% Uso: flores_com(cor_petala, amarelo, Flor)
flores_com(Atributo, Valor, Flor) :-
    caracteristica(Flor, Atributo, Valor).
% flores_com_cor/2 — busca por cor levando em conta hierarquia
% Uso: flores_com_cor(amarelo, Flor)
flores_com_cor(CorGeral, Flor) :-
    subclasse_cor(CorEspecifica, CorGeral),
    caracteristica(Flor, cor_petala, CorEspecifica).
flores_com_cor(CorGeral, Flor) :-
    caracteristica(Flor, cor_petala, CorGeral).
flores_com_cor(CorEspecifica, Flor) :-
    subclasse_cor(CorEspecifica, _),
    caracteristica(Flor, cor_petala, CorEspecifica).
% total_caracteristicas/2 — conta quantas características tem uma flor
total_caracteristicas(Flor, Total) :-
    findall(1, caracteristica(Flor, _, _), Lista),
    length(Lista, Total).
 
% flores_unicas/1 — lista todas as flores sem duplicatas
flores_unicas(Flores) :-
    findall(F, caracteristica(F, _, _), Todas),
    sort(Todas, Flores).
 
