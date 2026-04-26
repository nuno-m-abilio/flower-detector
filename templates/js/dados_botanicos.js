/**
 * dados_botanicos.js
 * Dicionário de atributos botânicos alinhado com flores.pl e app.py.
 * Chave = nome do atributo no Prolog (ex: "cor_petala").
 * multiselect: true → o usuário pode escolher mais de um valor.
 */
const dicionarioBotanico = {
  // ── FLORES ──────────────────────────────────────────────────────────────

  cor_petala: {
    label: "Cor das Pétalas",
    multiselect: true,
    opcoes: [
      // Amarelo
      { valor: "amarelo", texto: "Amarelo"},
      { valor: "amarelo_palha", texto: "Amarelo-palha" },
      { valor: "amarelo_creme", texto: "Amarelo-creme" },
      { valor: "amarelo_limao", texto: "Amarelo-limão" },
      { valor: "amarelo_dourado", texto: "Amarelo-dourado" },
      { valor: "amarelo_ambar", texto: "Amarelo-âmbar" },
      { valor: "amarelo_mostarda", texto: "Amarelo-mostarda" },
      // Laranja
      { valor: "laranja", texto: "Laranja"},
      { valor: "laranja_pessego", texto: "Laranja-pêssego" },
      { valor: "laranja_claro", texto: "Laranja-claro" },
      { valor: "laranja_vivo", texto: "Laranja-vivo" },
      { valor: "laranja_cobre", texto: "Laranja-cobre" },
      { valor: "laranja_queimado", texto: "Laranja-queimado" },
      // Vermelho
      { valor: "vermelho", texto: "Vermelho"},
      { valor: "vermelho_rosado", texto: "Vermelho-rosado" },
      { valor: "vermelho_cereja", texto: "Vermelho-cereja" },
      { valor: "vermelho_escarlate", texto: "Vermelho-escarlate" },
      { valor: "vermelho_carmim", texto: "Vermelho-carmim" },
      { valor: "vermelho_bordeaux", texto: "Vermelho-bordeaux" },
      { valor: "vermelho_enegrecido", texto: "Vermelho-enegrecido" },
      // Rosa
      { valor: "rosa", texto: "Rosa"},
      { valor: "rosa_bebe", texto: "Rosa-bebê" },
      { valor: "rosa_quartzo", texto: "Rosa-quartzo" },
      { valor: "rosa_chiclete",texto: "Rosa-chiclete" },
      { valor: "rosa_coral",   texto: "Rosa-coral" },
      { valor: "rosa_pink",    texto: "Rosa-pink" },
      { valor: "rosa_fucsia",  texto: "Rosa-fúcsia" },
      { valor: "rosa_magenta", texto: "Rosa-magenta" },
      // Roxo
      { valor: "roxo", texto: "Roxo"},
      { valor: "lilas", texto: "Lilás" },
      { valor: "lavanda", texto: "Lavanda" },
      { valor: "violeta_claro", texto: "Violeta-claro" },
      { valor: "violeta_medio", texto: "Violeta-médio" },
      { valor: "violeta_intenso", texto: "Violeta-intenso" },
      { valor: "roxo_escuro", texto: "Roxo-escuro" },
      { valor: "roxo_enegrecido", texto: "Roxo-enegrecido" },
      // Azul
      { valor: "azul", texto: "Azul"},
      { valor: "azul_celeste", texto: "Azul-celeste" },
      { valor: "azul_periwinkle", texto: "Azul-periwinkle" },
      { valor: "azul_medio", texto: "Azul-médio" },
      { valor: "azul_cobalto", texto: "Azul-cobalto" },
      { valor: "azul_indigo", texto: "Azul-índigo" },
      // Verde
      { valor: "verde", texto: "Verde"},
      { valor: "verde_claro", texto: "Verde-claro" },
      { valor: "verde_menta", texto: "Verde-menta" },
      { valor: "verde_medio", texto: "Verde-médio" },
      { valor: "verde_escuro", texto: "Verde-escuro" },
      // Branco
      { valor: "branco", texto: "Branco"},
      { valor: "branco_puro", texto: "Branco-puro" },
      { valor: "branco_creme", texto: "Branco-creme" },
      { valor: "branco_esverdeado", texto: "Branco-esverdeado" },
      { valor: "branco_rosado", texto: "Branco-rosado" },
      // Multicolor
      { valor: "bicolor_contrastante", texto: "Bicolor contrastante" },
      { valor: "degrade",              texto: "Degradê (ombré)" },
      { valor: "manchada",             texto: "Manchada / Pintalgada" },
      { valor: "listrada",             texto: "Listrada" },
      { valor: "com_olho_central",     texto: "Com olho central" },
    ],
  },

  forma_petala: {
    label: "Forma da Pétala",
    multiselect: true,
    opcoes: [
      { valor: "arredondada",       texto: "Arredondada" },
      { valor: "espatulada_petala", texto: "Espatulada" },
      { valor: "lanceolada_petala", texto: "Lanceolada" },
      { valor: "linear_petala",     texto: "Linear" },
      { valor: "fimbriada",         texto: "Fimbriada / Franjada" },
      { valor: "ondulada_petala",   texto: "Ondulada" },
      { valor: "encurvada",         texto: "Encurvada" },
      { valor: "reflexa",           texto: "Reflexa" },
    ],
  },

  textura_petala: {
    label: "Textura da Pétala",
    multiselect: true,
    opcoes: [
      { valor: "lisa",          texto: "Lisa" },
      { valor: "velutinosa",    texto: "Aveludada" },
      { valor: "cerosa_petala", texto: "Cerosa" },
      { valor: "translucida",   texto: "Translúcida" },
      { valor: "papilosa",      texto: "Papilosa" },
    ],
  },

  numero_petalas: {
    label: "Número de Pétalas",
    multiselect: true,
    opcoes: [
      { valor: "uma",              texto: "1 pétala" },
      { valor: "tres",             texto: "3 pétalas" },
      { valor: "quatro",           texto: "4 pétalas" },
      { valor: "cinco",            texto: "5 pétalas" },
      { valor: "seis",             texto: "6 pétalas" },
      { valor: "oito_a_doze",      texto: "8 a 12 pétalas" },
      { valor: "treze_a_vinteuma", texto: "13 a 21 pétalas" },
      { valor: "numerosas",        texto: "Numerosas (> 21)" },
    ],
  },

  disposicao_corola: {
    label: "Disposição das Pétalas",
    multiselect: true,
    opcoes: [
      { valor: "simples_disposicao", texto: "Simples" },
      { valor: "semi_dupla",         texto: "Semi-dupla" },
      { valor: "dupla",              texto: "Dupla" },
      { valor: "pompom",             texto: "Pompom" },
    ],
  },

  formato_corola: {
    label: "Formato Geral da Flor",
    multiselect: true,
    opcoes: [
      { valor: "estrelada",         texto: "Estrelada" },
      { valor: "tubular",           texto: "Tubular" },
      { valor: "campanulada",       texto: "Campanulada (sino)" },
      { valor: "infundibuliforme",  texto: "Infundibuliforme (funil)" },
      { valor: "rotacea",           texto: "Rotácea (plana)" },
      { valor: "bilabial",          texto: "Bilabial" },
      { valor: "papilionacea",      texto: "Papilionácea (borboleta)" },
      { valor: "em_espata",         texto: "Em espata" },
      { valor: "ligulada",          texto: "Ligulada (fita)" },
      { valor: "capitular",         texto: "Capitular (cabeça)" },
    ],
  },

  simetria: {
    label: "Simetria",
    multiselect: true,
    opcoes: [
      { valor: "actinomorfa", texto: "Radial (estrela)" },
      { valor: "zigomorfa",   texto: "Bilateral" },
      { valor: "assimetrica", texto: "Assimétrica" },
    ],
  },

  inflorescencia: {
    label: "Inflorescência",
    multiselect: true,
    opcoes: [
      { valor: "flor_solitaria",  texto: "Solitária" },
      { valor: "racemo",          texto: "Racemo" },
      { valor: "espiga",          texto: "Espiga" },
      { valor: "umbela",          texto: "Umbela" },
      { valor: "corimbo",         texto: "Corimbo" },
      { valor: "cimeira",         texto: "Cimeira" },
      { valor: "capitulo",        texto: "Capítulo" },
      { valor: "cacho",           texto: "Cacho / Panícula" },
      { valor: "espata_espadice", texto: "Espata + Espádice" },
    ],
  },

  intensidade_aroma: {
    label: "Intensidade do Aroma",
    multiselect: true,
    opcoes: [
      { valor: "inodora",      texto: "Inodora (sem cheiro)" },
      { valor: "suave",        texto: "Suave" },
      { valor: "moderado",     texto: "Moderado" },
      { valor: "intenso",      texto: "Intenso" },
      { valor: "muito_intenso",texto: "Muito intenso" },
    ],
  },

  categoria_aroma: {
    label: "Tipo de Aroma",
    multiselect: true,
    opcoes: [
      { valor: "floral_doce",  texto: "Floral-doce" },
      { valor: "citrico",      texto: "Cítrico" },
      { valor: "especiado",    texto: "Especiado" },
      { valor: "frutal",       texto: "Frutal" },
      { valor: "mel_nectar",   texto: "Mel / Néctar" },
      { valor: "fresco_verde", texto: "Fresco / Verde" },
      { valor: "almiscarado",  texto: "Almiscarado" },
      { valor: "desagradavel", texto: "Desagradável" },
    ],
  },

  polinizacao: {
    label: "Polinizadores",
    multiselect: true,          // ← MÚLTIPLA SELEÇÃO
    opcoes: [
      { valor: "abelhas",     texto: "Abelhas" },
      { valor: "borboletas",  texto: "Borboletas" },
      { valor: "mariposas",   texto: "Mariposas" },
      { valor: "besouros",    texto: "Besouros" },
      { valor: "moscas",      texto: "Moscas" },
      { valor: "passaros",    texto: "Pássaros" },
      { valor: "morcegos",    texto: "Morcegos" },
      { valor: "vento",       texto: "Vento" },
      { valor: "agua",        texto: "Água" },
    ],
  },

  // ── FOLHAS ──────────────────────────────────────────────────────────────

  estrutura_limbo: {
    label: "Estrutura da Folha",
    multiselect: true,
    opcoes: [
      { valor: "simples_estrutura",       texto: "Simples" },
      { valor: "composta_pinada",         texto: "Composta pinada" },
      { valor: "composta_imparipinada",   texto: "Composta imparipinada" },
      { valor: "composta_paripinada",     texto: "Composta paripinada" },
      { valor: "composta_bipinada",       texto: "Bipinada" },
      { valor: "composta_palmada",        texto: "Palmada" },
      { valor: "composta_trifoliada",     texto: "Trifoliada" },
    ],
  },

  formato_limbo: {
    label: "Formato da Folha",
    multiselect: true,
    opcoes: [
      { valor: "circular",          texto: "Circular" },
      { valor: "oval",              texto: "Oval" },
      { valor: "obovada",           texto: "Obovada" },
      { valor: "eliptica",          texto: "Elíptica" },
      { valor: "lanceolada_limbo",  texto: "Lanceolada" },
      { valor: "oblanceolada",      texto: "Oblanceolada" },
      { valor: "linear_limbo",      texto: "Linear" },
      { valor: "acicular",          texto: "Acicular (agulha)" },
      { valor: "espatulada_limbo",  texto: "Espatulada" },
      { valor: "reniforme",         texto: "Reniforme (rim)" },
      { valor: "cordada",           texto: "Cordada (coração)" },
      { valor: "sagitada",          texto: "Sagitada (seta)" },
      { valor: "hastada",           texto: "Hastada" },
      { valor: "lobada",            texto: "Lobada" },
      { valor: "trilobada",         texto: "Trilobada" },
      { valor: "palmatilobada",     texto: "Palmatilobada" },
      { valor: "penatilobada",      texto: "Penatilobada" },
      { valor: "laciniada",         texto: "Laciniada" },
    ],
  },

  margem_limbo: {
    label: "Margem da Folha",
    multiselect: true,
    opcoes: [
      { valor: "inteira",       texto: "Inteira (lisa)" },
      { valor: "dentada",       texto: "Dentada" },
      { valor: "serrada",       texto: "Serrada" },
      { valor: "crenada",       texto: "Crenada" },
      { valor: "ondulada_limbo",texto: "Ondulada" },
      { valor: "ciliada",       texto: "Ciliada" },
      { valor: "espinhosa",     texto: "Espinhosa" },
    ],
  },

  cor_folha: {
    label: "Cor da Folha",
    multiselect: true,
    opcoes: [
      { valor: "verde_claro_folha",       texto: "Verde-claro" },
      { valor: "verde_medio_folha",       texto: "Verde-médio" },
      { valor: "verde_escuro_folha",      texto: "Verde-escuro" },
      { valor: "verde_azulado_folha",     texto: "Verde-azulado" },
      { valor: "verde_amarelado_folha",   texto: "Verde-amarelado" },
      { valor: "variegada_branca_folha",  texto: "Variegada (branca)" },
      { valor: "variegada_amarela_folha", texto: "Variegada (amarela)" },
      { valor: "variegada_prateada_folha",texto: "Variegada (prateada)" },
      { valor: "avermelhada_folha",       texto: "Avermelhada / Roxa" },
      { valor: "bronzeada_folha",         texto: "Bronzeada" },
      { valor: "cinza_folha",             texto: "Cinza / Prateada" },
    ],
  },

  textura_folha: {
    label: "Textura da Folha",
    multiselect: true,
    opcoes: [
      { valor: "lisa_brilhante", texto: "Lisa e brilhante" },
      { valor: "lisa_opaca",     texto: "Lisa e opaca" },
      { valor: "pubescente",     texto: "Pubescente (pelos finos)" },
      { valor: "tomentosa",      texto: "Tomentosa (feltro)" },
      { valor: "rugosa",         texto: "Rugosa" },
      { valor: "bolhosa",        texto: "Bolhosa" },
      { valor: "cerosa_folha",   texto: "Cerosa" },
      { valor: "viscosa",        texto: "Viscosa / Pegajosa" },
    ],
  },

  // ── CAULE ───────────────────────────────────────────────────────────────

  consistencia_caule: {
    label: "Tipo de Caule",
    multiselect: true,
    opcoes: [
      { valor: "herbaceo",        texto: "Herbáceo" },
      { valor: "sublenhoso",      texto: "Sublenhoso" },
      { valor: "lenhoso_arbusto", texto: "Lenhoso (arbusto)" },
      { valor: "lenhoso_arvore",  texto: "Lenhoso (árvore)" },
      { valor: "suculento",       texto: "Suculento" },
      { valor: "trepador",        texto: "Trepador" },
      { valor: "rasteiro",        texto: "Rasteiro" },
      { valor: "rizomatoso",      texto: "Rizomatoso" },
      { valor: "bulboso",         texto: "Bulboso" },
      { valor: "tuberoso",        texto: "Tuberoso" },
    ],
  },

  superficie_caule: {
    label: "Superfície do Caule",
    multiselect: true,
    opcoes: [
      { valor: "liso",      texto: "Liso" },
      { valor: "piloso",    texto: "Piloso (peludo)" },
      { valor: "aculeado",  texto: "Aculeado (espinhos)" },
      { valor: "espinhoso", texto: "Espinhoso" },
      { valor: "estriado",  texto: "Estriado" },
      { valor: "alado",     texto: "Alado" },
      { valor: "ceroso",    texto: "Ceroso" },
      { valor: "nodoso",    texto: "Nodoso" },
    ],
  },

  // ── CARACTERÍSTICAS GERAIS ──────────────────────────────────────────────

  porte_planta: {
    label: "Porte da Planta",
    multiselect: true,
    opcoes: [
      { valor: "miniatura",  texto: "Miniatura (até 15 cm)" },
      { valor: "rasteira",   texto: "Rasteira (15–40 cm)" },
      { valor: "media",      texto: "Média (40 cm–1 m)" },
      { valor: "alta",       texto: "Alta (1–2 m)" },
      { valor: "arbustiva",  texto: "Arbustiva (1–3 m)" },
      { valor: "arborea",    texto: "Arbórea (> 3 m)" },
    ],
  },

  ciclo_vida: {
    label: "Ciclo de Vida",
    multiselect: true,
    opcoes: [
      { valor: "anual",               texto: "Anual" },
      { valor: "bienal",              texto: "Bienal" },
      { valor: "perene_sempre_verde", texto: "Perene (sempre verde)" },
      { valor: "perene_caduca",       texto: "Perene (caduca)" },
      { valor: "geofita",             texto: "Geófita (bulbo/rizoma)" },
    ],
  },

  epoca_floracao: {
    label: "Época de Floração",
    multiselect: true,          // ← MÚLTIPLA SELEÇÃO
    opcoes: [
      { valor: "primavera",     texto: "Primavera" },
      { valor: "verao",         texto: "Verão" },
      { valor: "outono",        texto: "Outono" },
      { valor: "inverno",       texto: "Inverno" },
      { valor: "floracao_longa",texto: "Floração longa (várias estações)" },
      { valor: "reflorescente", texto: "Reflorescente (re-floresce)" },
      { valor: "noturna",       texto: "Noturna" },
    ],
  },

  habitat_origem: {
    label: "Habitat / Origem",
    multiselect: true,
    opcoes: [
      { valor: "temperado",    texto: "Temperado" },
      { valor: "mediterraneo", texto: "Mediterrâneo" },
      { valor: "tropical",     texto: "Tropical" },
      { valor: "subtropical",  texto: "Subtropical" },
      { valor: "alpino",       texto: "Alpino / Montanhoso" },
      { valor: "aquatico",     texto: "Aquático" },
      { valor: "desertico",    texto: "Desértico" },
      { valor: "epifita",      texto: "Epífita (cresce em outras plantas)" },
    ],
  },

  toxicidade: {
    label: "Toxicidade",
    multiselect: true,
    opcoes: [
      { valor: "nao_toxica",          texto: "Não tóxica" },
      { valor: "toxica_para_animais", texto: "Tóxica para animais" },
      { valor: "toxica_para_humanos", texto: "Tóxica para humanos" },
      { valor: "suco_irritante",      texto: "Suco irritante" },
      { valor: "altamente_venenosa",  texto: "Altamente venenosa" },
    ],
  },
};