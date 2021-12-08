// Stores common JS variables

var pref_info = {
  '-': {
    dev: "-",
    rom: "-"
  },
  'aXi': {
    dev: "अधि",
    rom: "adhi"
  },
  'aXiYava': {
    dev: "अधि_अव",
    rom: "adhi_ava"
  },
  'aXiYAf': {
    dev: "अधि_आङ्",
    rom: "adhi_āṅ"
  },
  'anu': {
    dev: "अनु",
    rom: "anu"
  },
  'anuYAf': {
    dev: "अनु_आङ्",
    rom: "anu_āṅ"
  },
  'anuYnis': {
    dev: "अनु_निस्",
    rom: "anu_nis"
  },
  'anuYpra': {
    dev: "अनु_प्र",
    rom: "anu_pra"
  },
  'anuYvi': {
    dev: "अनु_वि",
    rom: "anu_vi"
  },
  'anuYsam': {
    dev: "अनु_सम्",
    rom: "anu_sam"
  },
  'apa': {
    dev: "अप",
    rom: "apa"
  },
  'apaYAf': {
    dev: "अप_आङ्",
    rom: "apa_āṅ"
  },
  'apaYni': {
    dev: "अप_नि",
    rom: "apa_ni"
  },
  'apaYpra': {
    dev: "अप_प्र",
    rom: "apa_pra"
  },
  'apaYvi': {
    dev: "अप_वि",
    rom: "apa_vi"
  },
  'aBi': {
    dev: "अभि",
    rom: "abhi"
  },
  'aBiYaXi': {
    dev: "अभि_अधि",
    rom: "abhi_adhi"
  },
  'aBiYanu': {
    dev: "अभि_अनु",
    rom: "abhi_anu"
  },
  'aBiYava': {
    dev: "अभि_अव",
    rom: "abhi_ava"
  },
  'aBiYAf': {
    dev: "अभि_आङ्",
    rom: "abhi_āṅ"
  },
  'aBiYuw': {
    dev: "अभि_उत्",
    rom: "abhi_ut"
  },
  'aBiYupa': {
    dev: "अभि_उप",
    rom: "abhi_upa"
  },
  'aBiYni': {
    dev: "अभि_नि",
    rom: "abhi_ni"
  },
  'aBiYnis': {
    dev: "अभि_निस्",
    rom: "abhi_nis"
  },
  'aBiYpra': {
    dev: "अभि_प्र",
    rom: "abhi_pra"
  },
  'aBiYvi': {
    dev: "अभि_वि",
    rom: "abhi_vi"
  },
  'aBiYsam': {
    dev: "अभि_सम्",
    rom: "abhi_sam"
  },
  'ava': {
    dev: "अव",
    rom: "ava"
  },
  'avaYni': {
    dev: "अव_नि",
    rom: "ava_ni"
  },
  'Af': {
    dev: "आङ्",
    rom: "āṅ"
  },
  'AfYviS': {
    dev: "आङ्_विश्",
    rom: "āṅ_viś"
  },
  'uw': {
    dev: "उत्",
    rom: "ut"
  },
  'uwYvi': {
    dev: "उत्_वि",
    rom: "ut_vi"
  },
  'upa': {
    dev: "उप",
    rom: "upa"
  },
  'upaYAf': {
    dev: "उप_आङ्",
    rom: "upa_āṅ"
  },
  'upaYni': {
    dev: "उप_नि",
    rom: "upa_ni"
  },
  'upaYnis': {
    dev: "उप_निस्",
    rom: "upa_nis"
  },
  'upaYpra': {
    dev: "उप_प्र",
    rom: "upa_pra"
  },
  'upa_sam': {
    dev: "उप_सम्",
    rom: "upa_sam"
  },
  'xur': {
    dev: "दुर्",
    rom: "dur"
  },
  'xurYAf': {
    dev: "दुर्_आङ्",
    rom: "dur_āṅ"
  },
  'xurYni': {
    dev: "दुर्_नि",
    rom: "dur_ni"
  },
  'xusYsam': {
    dev: "दुस्_सम्",
    rom: "dus_sam"
  },
  'ni': {
    dev: "नि",
    rom: "ni"
  },
  'nir': {
    dev: "निर्",
    rom: "nir"
  },
  'nirYava': {
    dev: "निर्_अव",
    rom: "nir_ava"
  },
  'nirYAf': {
    dev: "निर्_आङ्",
    rom: "nir_āṅ"
  },
  'nirYvi': {
    dev: "निर्_वि",
    rom: "nir_vi"
  },
  'niYsu': {
    dev: "नि_सु",
    rom: "ni_su"
  },
  'para': {
    dev: "पर",
    rom: "para"
  },
  'parA': {
    dev: "परा",
    rom: "parā"
  },
  'pari': {
    dev: "परि",
    rom: "pari"
  },
  'pariYanu': {
    dev: "परि_अनु",
    rom: "pari_anu"
  },
  'pariYava': {
    dev: "परि_अव",
    rom: "pari_ava"
  },
  'pariYAf': {
    dev: "परि_आङ्",
    rom: "pari_āṅ"
  },
  'pariYuw': {
    dev: "परि_उत्",
    rom: "pari_ut"
  },
  'pariYupa': {
    dev: "परि_उप",
    rom: "pari_upa"
  },
  'pariYni': {
    dev: "परि_नि",
    rom: "pari_ni"
  },
  'pariYsam': {
    dev: "परि_सम्",
    rom: "pari_sam"
  },
  'pra': {
    dev: "प्र",
    rom: "pra"
  },
  'praYAf': {
    dev: "प्र_आङ्",
    rom: "pra_āṅ"
  },
  'praYAf_xus': {
    dev: "प्र_आङ्_दुस्",
    rom: "pra_āṅ_dus"
  },
  'prawi': {
    dev: "प्रति",
    rom: "prati"
  },
  'prawiYava': {
    dev: "प्रति_अव",
    rom: "prati_ava"
  },
  'prawiYAf': {
    dev: "प्रति_आङ्",
    rom: "prati_āṅ"
  },
  'prawiYuw': {
    dev: "प्रति_उत्",
    rom: "prati_ut"
  },
  'prawiYuwYAf': {
    dev: "प्रति_उत्_आङ्",
    rom: "prati_ut_āṅ"
  },
  'prawiYupa': {
    dev: "प्रति_उप",
    rom: "prati_upa"
  },
  'prawi_upaYAf': {
    dev: "प्रति_उप_आङ्",
    rom: "prati_upa_āṅ"
  },
  'prawiYni': {
    dev: "प्रति_नि",
    rom: "prati_ni"
  },
  'prawiYpra': {
    dev: "प्रति_प्र",
    rom: "prati_pra"
  },
  'prawiYvi': {
    dev: "प्रति_वि",
    rom: "prati_vi"
  },
  'prawiYviYAf': {
    dev: "प्रति_वि_आङ्",
    rom: "prati_vi_āṅ"
  },
  'prawiYsam': {
    dev: "प्रति_सम्",
    rom: "prati_sam"
  },
  'praYni': {
    dev: "प्र_नि",
    rom: "pra_ni"
  },
  'praYvi': {
    dev: "प्र_वि",
    rom: "pra_vi"
  },
  'praYviYsam': {
    dev: "प्र_वि_सम्",
    rom: "pra_vi_sam"
  },
  'vi': {
    dev: "वि",
    rom: "vi"
  },
  'viYawi': {
    dev: "वि_अति",
    rom: "vi_ati"
  },
  'viYapa': {
    dev: "वि_अप",
    rom: "vi_apa"
  },
  'viYaBi': {
    dev: "वि_अभि",
    rom: "vi_abhi"
  },
  'viYava': {
    dev: "वि_अव",
    rom: "vi_ava"
  },
  'viYAf': {
    dev: "वि_आङ्",
    rom: "vi_āṅ"
  },
  'viYuw': {
    dev: "वि_उत्",
    rom: "vi_ut"
  },
  'viYupa': {
    dev: "वि_उप",
    rom: "vi_upa"
  },
  'viYni': {
    dev: "वि_नि",
    rom: "vi_ni"
  },
  'viYnis': {
    dev: "वि_निस्",
    rom: "vi_nis"
  },
  'viYpari': {
    dev: "वि_परि",
    rom: "vi_pari"
  },
  'viYpra': {
    dev: "वि_प्र",
    rom: "vi_pra"
  },
  'viYprawi': {
    dev: "वि_प्रति",
    rom: "vi_prati"
  },
  'viYsam': {
    dev: "वि_सम्",
    rom: "vi_sam"
  },
  'sam': {
    dev: "सम्",
    rom: "sam"
  },
  'samYaXi': {
    dev: "सम्_अधि",
    rom: "sam_adhi"
  },
  'samYanu': {
    dev: "सम्_अनु",
    rom: "sam_anu"
  },
  'samYapa': {
    dev: "सम्_अप",
    rom: "sam_apa"
  },
  'samYaBi': {
    dev: "सम्_अभि",
    rom: "sam_abhi"
  },
  'samYaBiYuw': {
    dev: "सम्_अभि_उत्",
    rom: "sam_abhi_ut"
  },
  'samYava': {
    dev: "सम्_अव",
    rom: "sam_ava"
  },
  'samYAf': {
    dev: "सम्_आङ्",
    rom: "sam_āṅ"
  },
  'samYuw': {
    dev: "सम्_उत्",
    rom: "sam_ut"
  },
  'samYupa': {
    dev: "सम्_उप",
    rom: "sam_upa"
  },
  'samYupaYAf': {
    dev: "सम्_उप_आङ्",
    rom: "sam_upa_āṅ"
  },
  'samYni': {
    dev: "सम्_नि",
    rom: "sam_ni"
  },
  'samYpra': {
    dev: "सम्_प्र",
    rom: "sam_pra"
  },
  'samYprawi': {
    dev: "सम्_प्रति",
    rom: "sam_prati"
  },
  'samYvi': {
    dev: "सम्_वि",
    rom: "sam_vi"
  },
  'su': {
    dev: "सु",
    rom: "su"
  }
};

var root_info = {
  'aMSa1_aMSa_curAxiH_samaGAwe': {
    dev: "अंश (अंश) समघाते चुरादिः",
    rom: "aṃśa (aṃśa) samaghāte curādiḥ"
  },
  'aMsa1_aMsa_curAxiH_samAGAwe': {
    dev: "अंस (अंस) समाघाते चुरादिः",
    rom: "aṃsa (aṃsa) samāghāte curādiḥ"
  },
  'aki1_aki_curAxiH_lakRaNe': {
    dev: "अकि (अकि) लक्षणे चुरादिः",
    rom: "aki (aki) lakṣaṇe curādiḥ"
  },
  'ak1_akaz_BvAxiH_kutilAyAM_gawO': {
    dev: "अक् (अकँ) कुटिलायां_गतौ भ्वादिः",
    rom: "ak (akaṁ) kuṭilāyāṃ_gatau bhvādiḥ"
  },
  'ak2_akiz_BvAxiH_lakRaNe': {
    dev: "अक् (अकिँ) लक्षणे भ्वादिः",
    rom: "ak (akiṁ) lakṣaṇe bhvādiḥ"
  },
  'akR1_akRUz_BvAxiH_vyApwO': {
    dev: "अक्ष् (अक्षूँ) व्याप्तौ भ्वादिः",
    rom: "akṣ (akṣūṁ) vyāptau bhvādiḥ"
  },
  'akR1_akRUz_BvAxiH_safGAwe': {
    dev: "अक्ष् (अक्षूँ) सङ्घाते भ्वादिः",
    rom: "akṣ (akṣūṁ) saṅghāte bhvādiḥ"
  },
  'ag1_agaz_BvAxiH_kutilAyAM_gawO': {
    dev: "अग् (अगँ) कुटिलायां_गतौ भ्वादिः",
    rom: "ag (agaṁ) kuṭilāyāṃ_gatau bhvādiḥ"
  },
  'ag2_agiz_BvAxiH_gawO': {
    dev: "अग् (अगिँ) गतौ भ्वादिः",
    rom: "ag (agiṁ) gatau bhvādiḥ"
  },
  'aG1_aGiz_BvAxiH_gawyAkRepe': {
    dev: "अघ् (अघिँ) गत्याक्षेपे भ्वादिः",
    rom: "agh (aghiṁ) gatyākṣepe bhvādiḥ"
  },
  'afka1_afka_curAxiH_paxe': {
    dev: "अङ्क (अङ्क) पदे चुरादिः",
    rom: "aṅka (aṅka) pade curādiḥ"
  },
  'afka1_afka_curAxiH_lakRaNe': {
    dev: "अङ्क (अङ्क) लक्षणे चुरादिः",
    rom: "aṅka (aṅka) lakṣaṇe curādiḥ"
  },
  'afga1_afga_curAxiH_paxe': {
    dev: "अङ्ग (अङ्ग) पदे चुरादिः",
    rom: "aṅga (aṅga) pade curādiḥ"
  },
  'afga1_afga_curAxiH_lakRaNe': {
    dev: "अङ्ग (अङ्ग) लक्षणे चुरादिः",
    rom: "aṅga (aṅga) lakṣaṇe curādiḥ"
  },
  'ac1_aciz_BvAxiH_gawO': {
    dev: "अच् (अचिँ) गतौ भ्वादिः",
    rom: "ac (aciṁ) gatau bhvādiḥ"
  },
  'aj1_ajaz_BvAxiH_kRepaNe': {
    dev: "अज् (अजँ) क्षेपणे भ्वादिः",
    rom: "aj (ajaṁ) kṣepaṇe bhvādiḥ"
  },
  'aj1_ajaz_BvAxiH_gawO': {
    dev: "अज् (अजँ) गतौ भ्वादिः",
    rom: "aj (ajaṁ) gatau bhvādiḥ"
  },
  'aj2_ajiz_curAxiH_BARArWe': {
    dev: "अज् (अजिँ) भाषार्थे चुरादिः",
    rom: "aj (ajiṁ) bhāṣārthe curādiḥ"
  },
  'aj2_ajiz_curAxiH_BAsArWe': {
    dev: "अज् (अजिँ) भासार्थे चुरादिः",
    rom: "aj (ajiṁ) bhāsārthe curādiḥ"
  },
  'at1_ataz_BvAxiH_gawO': {
    dev: "अट् (अटँ) गतौ भ्वादिः",
    rom: "aṭ (aṭaṁ) gatau bhvādiḥ"
  },
  'at2_atiz_BvAxiH_gawO': {
    dev: "अट् (अटिँ) गतौ भ्वादिः",
    rom: "aṭ (aṭiṁ) gatau bhvādiḥ"
  },
  'aT1_aTaz_BvAxiH_gawO': {
    dev: "अठ् (अठँ) गतौ भ्वादिः",
    rom: "aṭh (aṭhaṁ) gatau bhvādiḥ"
  },
  'aT2_aTiz_BvAxiH_gawO': {
    dev: "अठ् (अठिँ) गतौ भ्वादिः",
    rom: "aṭh (aṭhiṁ) gatau bhvādiḥ"
  },
  'ad1_adaz_BvAxiH_uxyamane': {
    dev: "अड् (अडँ) उद्यमने भ्वादिः",
    rom: "aḍ (aḍaṁ) udyamane bhvādiḥ"
  },
  'aN2_aNaz_xivAxiH_prANane': {
    dev: "अण् (अणँ) प्राणने दिवादिः",
    rom: "aṇ (aṇaṁ) prāṇane divādiḥ"
  },
  'aN1_aNaz_BvAxiH_Sabxe': {
    dev: "अण् (अणँ) शब्दे भ्वादिः",
    rom: "aṇ (aṇaṁ) śabde bhvādiḥ"
  },
  'aw1_awaz_BvAxiH_sAwawyagamane': {
    dev: "अत् (अतँ) सातत्यगमने भ्वादिः",
    rom: "at (ataṁ) sātatyagamane bhvādiḥ"
  },
  'aw2_awiz_BvAxiH_banXane': {
    dev: "अत् (अतिँ) बन्धने भ्वादिः",
    rom: "at (atiṁ) bandhane bhvādiḥ"
  },
  'awt1_awtaz_BvAxiH_awikramaNe': {
    dev: "अत्ट् (अत्टँ) अतिक्रमणे भ्वादिः",
    rom: "atṭ (atṭaṁ) atikramaṇe bhvādiḥ"
  },
  'awt2_awtaz_curAxiH_anAxare': {
    dev: "अत्ट् (अत्टँ) अनादरे चुरादिः",
    rom: "atṭ (atṭaṁ) anādare curādiḥ"
  },
  'awt1_awtaz_BvAxiH_hiMsAyAm': {
    dev: "अत्ट् (अत्टँ) हिंसायाम् भ्वादिः",
    rom: "atṭ (atṭaṁ) hiṃsāyām bhvādiḥ"
  },
  'ax2_axaz_axAxiH_BakRaNe': {
    dev: "अद् (अदँ) भक्षणे अदादिः",
    rom: "ad (adaṁ) bhakṣaṇe adādiḥ"
  },
  'ax1_axiz_BvAxiH_banXane': {
    dev: "अद् (अदिँ) बन्धने भ्वादिः",
    rom: "ad (adiṁ) bandhane bhvādiḥ"
  },
  'axd1_axdaz_BvAxiH_aBiyoge': {
    dev: "अद्ड् (अद्डँ) अभियोगे भ्वादिः",
    rom: "adḍ (adḍaṁ) abhiyoge bhvādiḥ"
  },
  'anu-ruX1_anu-ruXaz_xivAxiH_kAme': {
    dev: "अनु-रुध् (अनु-रुधँ) कामे दिवादिः",
    rom: "anu-rudh (anu-rudhaṁ) kāme divādiḥ"
  },
  'an1_anaz_axAxiH_prANane': {
    dev: "अन् (अनँ) प्राणने अदादिः",
    rom: "an (anaṁ) prāṇane adādiḥ"
  },
  'anc1_ancuz_BvAxiH_gawO': {
    dev: "अन्च् (अन्चुँ) गतौ भ्वादिः",
    rom: "anc (ancuṁ) gatau bhvādiḥ"
  },
  'anc1_ancuz_BvAxiH_pUjane': {
    dev: "अन्च् (अन्चुँ) पूजने भ्वादिः",
    rom: "anc (ancuṁ) pūjane bhvādiḥ"
  },
  'anc1_ancuz_BvAxiH_yAFcAyAm': {
    dev: "अन्च् (अन्चुँ) याञ्चायाम् भ्वादिः",
    rom: "anc (ancuṁ) yāñcāyām bhvādiḥ"
  },
  'anc2_ancuz_curAxiH_viSeRaNe': {
    dev: "अन्च् (अन्चुँ) विशेषणे चुरादिः",
    rom: "anc (ancuṁ) viśeṣaṇe curādiḥ"
  },
  'anj1_anjUz_ruXAxiH_kAnwO': {
    dev: "अन्ज् (अन्जूँ) कान्तौ रुधादिः",
    rom: "anj (anjūṁ) kāntau rudhādiḥ"
  },
  'anj1_anjUz_ruXAxiH_gawO': {
    dev: "अन्ज् (अन्जूँ) गतौ रुधादिः",
    rom: "anj (anjūṁ) gatau rudhādiḥ"
  },
  'anj1_anjUz_ruXAxiH_mrakRaNe': {
    dev: "अन्ज् (अन्जूँ) म्रक्षणे रुधादिः",
    rom: "anj (anjūṁ) mrakṣaṇe rudhādiḥ"
  },
  'anj1_anjUz_ruXAxiH_vyakwO': {
    dev: "अन्ज् (अन्जूँ) व्यक्तौ रुधादिः",
    rom: "anj (anjūṁ) vyaktau rudhādiḥ"
  },
  'anXa1_anXa_curAxiH_xqRtyupaGAwe': {
    dev: "अन्ध (अन्ध) दृष्ट्युपघाते चुरादिः",
    rom: "andha (andha) dṛṣṭyupaghāte curādiḥ"
  },
  'ab1_abiz_BvAxiH_Sabxe': {
    dev: "अब् (अबिँ) शब्दे भ्वादिः",
    rom: "ab (abiṁ) śabde bhvādiḥ"
  },
  'aBr1_aBraz_BvAxiH_gawO': {
    dev: "अभ्र् (अभ्रँ) गतौ भ्वादिः",
    rom: "abhr (abhraṁ) gatau bhvādiḥ"
  },
  'am1_amaz_BvAxiH_gawO': {
    dev: "अम् (अमँ) गतौ भ्वादिः",
    rom: "am (amaṁ) gatau bhvādiḥ"
  },
  'am2_amaz_curAxiH_roge': {
    dev: "अम् (अमँ) रोगे चुरादिः",
    rom: "am (amaṁ) roge curādiḥ"
  },
  'ay1_ayaz_BvAxiH_gawO': {
    dev: "अय् (अयँ) गतौ भ्वादिः",
    rom: "ay (ayaṁ) gatau bhvādiḥ"
  },
  'ark1_arkaz_curAxiH_swavane': {
    dev: "अर्क् (अर्कँ) स्तवने चुरादिः",
    rom: "ark (arkaṁ) stavane curādiḥ"
  },
  'arc2_arcaz_curAxiH_pUjAyAm': {
    dev: "अर्च् (अर्चँ) पूजायाम् चुरादिः",
    rom: "arc (arcaṁ) pūjāyām curādiḥ"
  },
  'arc1_arcaz_BvAxiH_pUjAyAm': {
    dev: "अर्च् (अर्चँ) पूजायाम् भ्वादिः",
    rom: "arc (arcaṁ) pūjāyām bhvādiḥ"
  },
  'arj1_arjaz_BvAxiH_arjane': {
    dev: "अर्ज् (अर्जँ) अर्जने भ्वादिः",
    rom: "arj (arjaṁ) arjane bhvādiḥ"
  },
  'arj2_arjaz_curAxiH_prawiyawne': {
    dev: "अर्ज् (अर्जँ) प्रतियत्ने चुरादिः",
    rom: "arj (arjaṁ) pratiyatne curādiḥ"
  },
  'arWa1_arWa_curAxiH_upayAFcAyAm': {
    dev: "अर्थ (अर्थ) उपयाञ्चायाम् चुरादिः",
    rom: "artha (artha) upayāñcāyām curādiḥ"
  },
  'arx1_arxaz_BvAxiH_gawO': {
    dev: "अर्द् (अर्दँ) गतौ भ्वादिः",
    rom: "ard (ardaṁ) gatau bhvādiḥ"
  },
  'arx1_arxaz_BvAxiH_yAFcAyAm': {
    dev: "अर्द् (अर्दँ) याञ्चायाम् भ्वादिः",
    rom: "ard (ardaṁ) yāñcāyām bhvādiḥ"
  },
  'arx2_arxaz_curAxiH_hiMsAyAm': {
    dev: "अर्द् (अर्दँ) हिंसायाम् चुरादिः",
    rom: "ard (ardaṁ) hiṃsāyām curādiḥ"
  },
  'arb1_arbaz_BvAxiH_gawO': {
    dev: "अर्ब् (अर्बँ) गतौ भ्वादिः",
    rom: "arb (arbaṁ) gatau bhvādiḥ"
  },
  'arv1_arvaz_BvAxiH_hiMsAyAm': {
    dev: "अर्व् (अर्वँ) हिंसायाम् भ्वादिः",
    rom: "arv (arvaṁ) hiṃsāyām bhvādiḥ"
  },
  'arh2_arhaz_curAxiH_pUjAyAm': {
    dev: "अर्ह् (अर्हँ) पूजायाम् चुरादिः",
    rom: "arh (arhaṁ) pūjāyām curādiḥ"
  },
  'arh1_arhaz_BvAxiH_pUjAyAm': {
    dev: "अर्ह् (अर्हँ) पूजायाम् भ्वादिः",
    rom: "arh (arhaṁ) pūjāyām bhvādiḥ"
  },
  'al1_alaz_BvAxiH_paryApwO': {
    dev: "अल् (अलँ) पर्याप्तौ भ्वादिः",
    rom: "al (alaṁ) paryāptau bhvādiḥ"
  },
  'al1_alaz_BvAxiH_BURAyAm': {
    dev: "अल् (अलँ) भूषायाम् भ्वादिः",
    rom: "al (alaṁ) bhūṣāyām bhvādiḥ"
  },
  'al1_alaz_BvAxiH_vAraNe': {
    dev: "अल् (अलँ) वारणे भ्वादिः",
    rom: "al (alaṁ) vāraṇe bhvādiḥ"
  },
  'av1_avaz_BvAxiH_avagamane': {
    dev: "अव् (अवँ) अवगमने भ्वादिः",
    rom: "av (avaṁ) avagamane bhvādiḥ"
  },
  'av1_avaz_BvAxiH_avApwO': {
    dev: "अव् (अवँ) अवाप्तौ भ्वादिः",
    rom: "av (avaṁ) avāptau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_Alifgane': {
    dev: "अव् (अवँ) आलिङ्गने भ्वादिः",
    rom: "av (avaṁ) āliṅgane bhvādiḥ"
  },
  'av1_avaz_BvAxiH_icCAyAm': {
    dev: "अव् (अवँ) इच्छायाम् भ्वादिः",
    rom: "av (avaṁ) icchāyām bhvādiḥ"
  },
  'av1_avaz_BvAxiH_kAnwO': {
    dev: "अव् (अवँ) कान्तौ भ्वादिः",
    rom: "av (avaṁ) kāntau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_kriyAyAm': {
    dev: "अव् (अवँ) क्रियायाम् भ्वादिः",
    rom: "av (avaṁ) kriyāyām bhvādiḥ"
  },
  'av1_avaz_BvAxiH_gawO': {
    dev: "अव् (अवँ) गतौ भ्वादिः",
    rom: "av (avaṁ) gatau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_wqpwO': {
    dev: "अव् (अवँ) तृप्तौ भ्वादिः",
    rom: "av (avaṁ) tṛptau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_xAne': {
    dev: "अव् (अवँ) दाने भ्वादिः",
    rom: "av (avaṁ) dāne bhvādiḥ"
  },
  'av1_avaz_BvAxiH_xIpwO': {
    dev: "अव् (अवँ) दीप्तौ भ्वादिः",
    rom: "av (avaṁ) dīptau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_praveSane': {
    dev: "अव् (अवँ) प्रवेशने भ्वादिः",
    rom: "av (avaṁ) praveśane bhvādiḥ"
  },
  'av1_avaz_BvAxiH_prIwO': {
    dev: "अव् (अवँ) प्रीतौ भ्वादिः",
    rom: "av (avaṁ) prītau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_BAge': {
    dev: "अव् (अवँ) भागे भ्वादिः",
    rom: "av (avaṁ) bhāge bhvādiḥ"
  },
  'av1_avaz_BvAxiH_yAFcAyAm': {
    dev: "अव् (अवँ) याञ्चायाम् भ्वादिः",
    rom: "av (avaṁ) yāñcāyām bhvādiḥ"
  },
  'av1_avaz_BvAxiH_rakRaNe': {
    dev: "अव् (अवँ) रक्षणे भ्वादिः",
    rom: "av (avaṁ) rakṣaṇe bhvādiḥ"
  },
  'av1_avaz_BvAxiH_vqxXO': {
    dev: "अव् (अवँ) वृद्धौ भ्वादिः",
    rom: "av (avaṁ) vṛddhau bhvādiḥ"
  },
  'av1_avaz_BvAxiH_SravaNe': {
    dev: "अव् (अवँ) श्रवणे भ्वादिः",
    rom: "av (avaṁ) śravaṇe bhvādiḥ"
  },
  'av1_avaz_BvAxiH_svAmyarWe': {
    dev: "अव् (अवँ) स्वाम्यर्थे भ्वादिः",
    rom: "av (avaṁ) svāmyarthe bhvādiḥ"
  },
  'av1_avaz_BvAxiH_hiMsAyAm': {
    dev: "अव् (अवँ) हिंसायाम् भ्वादिः",
    rom: "av (avaṁ) hiṃsāyām bhvādiḥ"
  },
  'aS2_aSaz_kryAxiH_Bojane': {
    dev: "अश् (अशँ) भोजने क्र्यादिः",
    rom: "aś (aśaṁ) bhojane kryādiḥ"
  },
  'aS1_aSUz_svAxiH_vyApwO': {
    dev: "अश् (अशूँ) व्याप्तौ स्वादिः",
    rom: "aś (aśūṁ) vyāptau svādiḥ"
  },
  'aS1_aSUz_svAxiH_safGAwe': {
    dev: "अश् (अशूँ) सङ्घाते स्वादिः",
    rom: "aś (aśūṁ) saṅghāte svādiḥ"
  },
  'as1_asaz_BvAxiH_AxAne': {
    dev: "अस् (असँ) आदाने भ्वादिः",
    rom: "as (asaṁ) ādāne bhvādiḥ"
  },
  'as1_asaz_BvAxiH_gawO': {
    dev: "अस् (असँ) गतौ भ्वादिः",
    rom: "as (asaṁ) gatau bhvādiḥ"
  },
  'as1_asaz_BvAxiH_xIpwO': {
    dev: "अस् (असँ) दीप्तौ भ्वादिः",
    rom: "as (asaṁ) dīptau bhvādiḥ"
  },
  'as2_asaz_axAxiH_Buvi': {
    dev: "अस् (असँ) भुवि अदादिः",
    rom: "as (asaṁ) bhuvi adādiḥ"
  },
  'as3_asuz_xivAxiH_kRepaNe': {
    dev: "अस् (असुँ) क्षेपणे दिवादिः",
    rom: "as (asuṁ) kṣepaṇe divādiḥ"
  },
  'asw1_aswaz_curAxiH_safGAwe': {
    dev: "अस्त् (अस्तँ) सङ्घाते चुरादिः",
    rom: "ast (astaṁ) saṅghāte curādiḥ"
  },
  'ah2_ahaz_svAxiH_vyApwO': {
    dev: "अह् (अहँ) व्याप्तौ स्वादिः",
    rom: "ah (ahaṁ) vyāptau svādiḥ"
  },
  'ah1_ahiz_BvAxiH_gawO': {
    dev: "अह् (अहिँ) गतौ भ्वादिः",
    rom: "ah (ahiṁ) gatau bhvādiḥ"
  },
  'ah3_ahiz_curAxiH_BARArWe': {
    dev: "अह् (अहिँ) भाषार्थे चुरादिः",
    rom: "ah (ahiṁ) bhāṣārthe curādiḥ"
  },
  'ah3_ahiz_curAxiH_BAsArWe': {
    dev: "अह् (अहिँ) भासार्थे चुरादिः",
    rom: "ah (ahiṁ) bhāsārthe curādiḥ"
  },
  'AC1_ACiz_BvAxiH_AyAme': {
    dev: "आछ् (आछिँ) आयामे भ्वादिः",
    rom: "āch (āchiṁ) āyāme bhvādiḥ"
  },
  'Ap2_ApLz_curAxiH_lamBane': {
    dev: "आप् (आपॢँ) लम्भने चुरादिः",
    rom: "āp (āpḷṁ) lambhane curādiḥ"
  },
  'Ap1_ApLz_svAxiH_vyApwO': {
    dev: "आप् (आपॢँ) व्याप्तौ स्वादिः",
    rom: "āp (āpḷṁ) vyāptau svādiḥ"
  },
  'As1_Asaz_axAxiH_upaveSane': {
    dev: "आस् (आसँ) उपवेशने अदादिः",
    rom: "ās (āsaṁ) upaveśane adādiḥ"
  },
  'i3_i_BvAxiH_gawO': {
    dev: "इ (इ) गतौ भ्वादिः",
    rom: "i (i) gatau bhvādiḥ"
  },
  'i4_ik_axAxiH_smaraNe': {
    dev: "इ (इक्) स्मरणे अदादिः",
    rom: "i (ik) smaraṇe adādiḥ"
  },
  'i2_if_axAxiH_aXyayane': {
    dev: "इ (इङ्) अध्ययने अदादिः",
    rom: "i (iṅ) adhyayane adādiḥ"
  },
  'i1_iN_axAxiH_gawO': {
    dev: "इ (इण्) गतौ अदादिः",
    rom: "i (iṇ) gatau adādiḥ"
  },
  'iK1_iKaz_BvAxiH_gawO': {
    dev: "इख् (इखँ) गतौ भ्वादिः",
    rom: "ikh (ikhaṁ) gatau bhvādiḥ"
  },
  'iK2_iKiz_BvAxiH_gawO': {
    dev: "इख् (इखिँ) गतौ भ्वादिः",
    rom: "ikh (ikhiṁ) gatau bhvādiḥ"
  },
  'ig1_igiz_BvAxiH_gawO': {
    dev: "इग् (इगिँ) गतौ भ्वादिः",
    rom: "ig (igiṁ) gatau bhvādiḥ"
  },
  'it1_itaz_BvAxiH_gawO': {
    dev: "इट् (इटँ) गतौ भ्वादिः",
    rom: "iṭ (iṭaṁ) gatau bhvādiḥ"
  },
  'ix1_ixiz_BvAxiH_paramESvarye': {
    dev: "इद् (इदिँ) परमैश्वर्ये भ्वादिः",
    rom: "id (idiṁ) paramaiśvarye bhvādiḥ"
  },
  'inX1_FiinXIz_ruXAxiH_xIpwO': {
    dev: "इन्ध् (ञिइन्धीँ) दीप्तौ रुधादिः",
    rom: "indh (ñiindhīṁ) dīptau rudhādiḥ"
  },
  'il1_ilaz_wuxAxiH_kRepaNe': {
    dev: "इल् (इलँ) क्षेपणे तुदादिः",
    rom: "il (ilaṁ) kṣepaṇe tudādiḥ"
  },
  'il2_ilaz_curAxiH_preraNe': {
    dev: "इल् (इलँ) प्रेरणे चुरादिः",
    rom: "il (ilaṁ) preraṇe curādiḥ"
  },
  'il1_ilaz_wuxAxiH_svapne': {
    dev: "इल् (इलँ) स्वप्ने तुदादिः",
    rom: "il (ilaṁ) svapne tudādiḥ"
  },
  'iv1_iviz_BvAxiH_prINane': {
    dev: "इव् (इविँ) प्रीणने भ्वादिः",
    rom: "iv (iviṁ) prīṇane bhvādiḥ"
  },
  'iv1_iviz_BvAxiH_vyApwO': {
    dev: "इव् (इविँ) व्याप्तौ भ्वादिः",
    rom: "iv (iviṁ) vyāptau bhvādiḥ"
  },
  'iR4_iRaz_kryAxiH_ABIkRNye': {
    dev: "इष् (इषँ) आभीक्ष्ण्ये क्र्यादिः",
    rom: "iṣ (iṣaṁ) ābhīkṣṇye kryādiḥ"
  },
  'iR3_iRaz_wuxAxiH_icCAyAm': {
    dev: "इष् (इषँ) इच्छायाम् तुदादिः",
    rom: "iṣ (iṣaṁ) icchāyām tudādiḥ"
  },
  'iR1_iRaz_xivAxiH_gawO': {
    dev: "इष् (इषँ) गतौ दिवादिः",
    rom: "iṣ (iṣaṁ) gatau divādiḥ"
  },
  'iR2_iRuz_wuxAxiH_icCAyAm': {
    dev: "इष् (इषुँ) इच्छायाम् तुदादिः",
    rom: "iṣ (iṣuṁ) icchāyām tudādiḥ"
  },
  'I1_If_xivAxiH_gawO': {
    dev: "ई (ईङ्) गतौ दिवादिः",
    rom: "ī (īṅ) gatau divādiḥ"
  },
  'IkR1_IkRaz_BvAxiH_xarSane': {
    dev: "ईक्ष् (ईक्षँ) दर्शने भ्वादिः",
    rom: "īkṣ (īkṣaṁ) darśane bhvādiḥ"
  },
  'IK1_IKiz_BvAxiH_gawO': {
    dev: "ईख् (ईखिँ) गतौ भ्वादिः",
    rom: "īkh (īkhiṁ) gatau bhvādiḥ"
  },
  'Ij1_Ijaz_BvAxiH_kuwsAyAm': {
    dev: "ईज् (ईजँ) कुत्सायाम् भ्वादिः",
    rom: "īj (ījaṁ) kutsāyām bhvādiḥ"
  },
  'Ij1_Ijaz_BvAxiH_gawO': {
    dev: "ईज् (ईजँ) गतौ भ्वादिः",
    rom: "īj (ījaṁ) gatau bhvādiḥ"
  },
  'Id1_Idaz_axAxiH_swuwO': {
    dev: "ईड् (ईडँ) स्तुतौ अदादिः",
    rom: "īḍ (īḍaṁ) stutau adādiḥ"
  },
  'Id2_Idaz_curAxiH_swuwO': {
    dev: "ईड् (ईडँ) स्तुतौ चुरादिः",
    rom: "īḍ (īḍaṁ) stutau curādiḥ"
  },
  'Ir1_Iraz_axAxiH_kampane': {
    dev: "ईर् (ईरँ) कम्पने अदादिः",
    rom: "īr (īraṁ) kampane adādiḥ"
  },
  'Ir2_Iraz_curAxiH_kRepe': {
    dev: "ईर् (ईरँ) क्षेपे चुरादिः",
    rom: "īr (īraṁ) kṣepe curādiḥ"
  },
  'Ir1_Iraz_axAxiH_gawO': {
    dev: "ईर् (ईरँ) गतौ अदादिः",
    rom: "īr (īraṁ) gatau adādiḥ"
  },
  'IrkRy1_IrkRyaz_BvAxiH_IrRyAyAm': {
    dev: "ईर्क्ष्य् (ईर्क्ष्यँ) ईर्ष्यायाम् भ्वादिः",
    rom: "īrkṣy (īrkṣyaṁ) īrṣyāyām bhvādiḥ"
  },
  'IrRy1_IrRyaz_BvAxiH_IrRyAyAm': {
    dev: "ईर्ष्य् (ईर्ष्यँ) ईर्ष्यायाम् भ्वादिः",
    rom: "īrṣy (īrṣyaṁ) īrṣyāyām bhvādiḥ"
  },
  'IS1_ISaz_axAxiH_ESvarye': {
    dev: "ईश् (ईशँ) ऐश्वर्ये अदादिः",
    rom: "īś (īśaṁ) aiśvarye adādiḥ"
  },
  'IR2_IRaz_BvAxiH_uFCe': {
    dev: "ईष् (ईषँ) उञ्छे भ्वादिः",
    rom: "īṣ (īṣaṁ) uñche bhvādiḥ"
  },
  'IR1_IRaz_BvAxiH_gawO': {
    dev: "ईष् (ईषँ) गतौ भ्वादिः",
    rom: "īṣ (īṣaṁ) gatau bhvādiḥ"
  },
  'IR1_IRaz_BvAxiH_xarSane': {
    dev: "ईष् (ईषँ) दर्शने भ्वादिः",
    rom: "īṣ (īṣaṁ) darśane bhvādiḥ"
  },
  'IR1_IRaz_BvAxiH_xAne': {
    dev: "ईष् (ईषँ) दाने भ्वादिः",
    rom: "īṣ (īṣaṁ) dāne bhvādiḥ"
  },
  'IR1_IRaz_BvAxiH_hiMsAyAm': {
    dev: "ईष् (ईषँ) हिंसायाम् भ्वादिः",
    rom: "īṣ (īṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'Ih1_Ihaz_BvAxiH_ceRtAyAm': {
    dev: "ईह् (ईहँ) चेष्टायाम् भ्वादिः",
    rom: "īh (īhaṁ) ceṣṭāyām bhvādiḥ"
  },
  'u1_uf_BvAxiH_Sabxe': {
    dev: "उ (उङ्) शब्दे भ्वादिः",
    rom: "u (uṅ) śabde bhvādiḥ"
  },
  'ukR1_ukRaz_BvAxiH_secane': {
    dev: "उक्ष् (उक्षँ) सेचने भ्वादिः",
    rom: "ukṣ (ukṣaṁ) secane bhvādiḥ"
  },
  'uK2_uKaz_BvAxiH_gawO': {
    dev: "उख् (उखँ) गतौ भ्वादिः",
    rom: "ukh (ukhaṁ) gatau bhvādiḥ"
  },
  'uK1_uKiz_BvAxiH_gawO': {
    dev: "उख् (उखिँ) गतौ भ्वादिः",
    rom: "ukh (ukhiṁ) gatau bhvādiḥ"
  },
  'uc1_ucaz_xivAxiH_samavAye': {
    dev: "उच् (उचँ) समवाये दिवादिः",
    rom: "uc (ucaṁ) samavāye divādiḥ"
  },
  'uC4_uCiz_wuxAxiH_uFCe': {
    dev: "उछ् (उछिँ) उञ्छे तुदादिः",
    rom: "uch (uchiṁ) uñche tudādiḥ"
  },
  'uC2_uCiz_BvAxiH_uFCe': {
    dev: "उछ् (उछिँ) उञ्छे भ्वादिः",
    rom: "uch (uchiṁ) uñche bhvādiḥ"
  },
  'uC3_uCIz_wuxAxiH_vivAse': {
    dev: "उछ् (उछीँ) विवासे तुदादिः",
    rom: "uch (uchīṁ) vivāse tudādiḥ"
  },
  'uC1_uCIz_BvAxiH_vivAse': {
    dev: "उछ् (उछीँ) विवासे भ्वादिः",
    rom: "uch (uchīṁ) vivāse bhvādiḥ"
  },
  'uT1_uTaz_BvAxiH_upaGAwe': {
    dev: "उठ् (उठँ) उपघाते भ्वादिः",
    rom: "uṭh (uṭhaṁ) upaghāte bhvādiḥ"
  },
  'uxJ1_uxJaz_wuxAxiH_uwsarge': {
    dev: "उद्झ् (उद्झँ) उत्सर्गे तुदादिः",
    rom: "udjh (udjhaṁ) utsarge tudādiḥ"
  },
  'unx1_unxIz_ruXAxiH_klexane': {
    dev: "उन्द् (उन्दीँ) क्लेदने रुधादिः",
    rom: "und (undīṁ) kledane rudhādiḥ"
  },
  'unB1_unBaz_wuxAxiH_pUraNe': {
    dev: "उन्भ् (उन्भँ) पूरणे तुदादिः",
    rom: "unbh (unbhaṁ) pūraṇe tudādiḥ"
  },
  'ubj1_ubjaz_wuxAxiH_Arjave': {
    dev: "उब्ज् (उब्जँ) आर्जवे तुदादिः",
    rom: "ubj (ubjaṁ) ārjave tudādiḥ"
  },
  'uB1_uBaz_wuxAxiH_pUraNe': {
    dev: "उभ् (उभँ) पूरणे तुदादिः",
    rom: "ubh (ubhaṁ) pūraṇe tudādiḥ"
  },
  'urx1_urxaz_BvAxiH_krIdAyAm': {
    dev: "उर्द् (उर्दँ) क्रीडायाम् भ्वादिः",
    rom: "urd (urdaṁ) krīḍāyām bhvādiḥ"
  },
  'urx1_urxaz_BvAxiH_mAne': {
    dev: "उर्द् (उर्दँ) माने भ्वादिः",
    rom: "urd (urdaṁ) māne bhvādiḥ"
  },
  'urv1_urvIz_BvAxiH_hiMsAyAm': {
    dev: "उर्व् (उर्वीँ) हिंसायाम् भ्वादिः",
    rom: "urv (urvīṁ) hiṃsāyām bhvādiḥ"
  },
  'uR1_uRaz_BvAxiH_xAhe': {
    dev: "उष् (उषँ) दाहे भ्वादिः",
    rom: "uṣ (uṣaṁ) dāhe bhvādiḥ"
  },
  'uh1_uhizr_BvAxiH_arxane': {
    dev: "उह् (उहिँर्) अर्दने भ्वादिः",
    rom: "uh (uhiṁr) ardane bhvādiḥ"
  },
  'Una1_Una_curAxiH_parihANe': {
    dev: "ऊन (ऊन) परिहाणे चुरादिः",
    rom: "ūna (ūna) parihāṇe curādiḥ"
  },
  'Uy1_UyIz_BvAxiH_wanwusanwAne': {
    dev: "ऊय् (ऊयीँ) तन्तुसन्ताने भ्वादिः",
    rom: "ūy (ūyīṁ) tantusantāne bhvādiḥ"
  },
  'Urj1_Urjaz_curAxiH_prANane': {
    dev: "ऊर्ज् (ऊर्जँ) प्राणने चुरादिः",
    rom: "ūrj (ūrjaṁ) prāṇane curādiḥ"
  },
  'Urj1_Urjaz_curAxiH_bale': {
    dev: "ऊर्ज् (ऊर्जँ) बले चुरादिः",
    rom: "ūrj (ūrjaṁ) bale curādiḥ"
  },
  'UrNu1_UrNuF_axAxiH_AcCAxane': {
    dev: "ऊर्णु (ऊर्णुञ्) आच्छादने अदादिः",
    rom: "ūrṇu (ūrṇuñ) ācchādane adādiḥ"
  },
  'UR1_URaz_BvAxiH_rujAyAm': {
    dev: "ऊष् (ऊषँ) रुजायाम् भ्वादिः",
    rom: "ūṣ (ūṣaṁ) rujāyām bhvādiḥ"
  },
  'Uh1_Uhaz_BvAxiH_viwarke': {
    dev: "ऊह् (ऊहँ) वितर्के भ्वादिः",
    rom: "ūh (ūhaṁ) vitarke bhvādiḥ"
  },
  'q1_q_BvAxiH_gawO': {
    dev: "ऋ (ऋ) गतौ भ्वादिः",
    rom: "ṛ (ṛ) gatau bhvādiḥ"
  },
  'q1_q_BvAxiH_prApaNe': {
    dev: "ऋ (ऋ) प्रापणे भ्वादिः",
    rom: "ṛ (ṛ) prāpaṇe bhvādiḥ"
  },
  'q2_q_juhowyAxiH_gawO': {
    dev: "ऋ (ऋ) गतौ जुहोत्यादिः",
    rom: "ṛ (ṛ) gatau juhotyādiḥ"
  },
  'qc1_qcaz_wuxAxiH_swuwO': {
    dev: "ऋच् (ऋचँ) स्तुतौ तुदादिः",
    rom: "ṛc (ṛcaṁ) stutau tudādiḥ"
  },
  'qC1_qCaz_wuxAxiH_inxriyapralaye': {
    dev: "ऋछ् (ऋछँ) इन्द्रियप्रलये तुदादिः",
    rom: "ṛch (ṛchaṁ) indriyapralaye tudādiḥ"
  },
  'qC1_qCaz_wuxAxiH_gawO': {
    dev: "ऋछ् (ऋछँ) गतौ तुदादिः",
    rom: "ṛch (ṛchaṁ) gatau tudādiḥ"
  },
  'qC1_qCaz_wuxAxiH_mUrwiBAve': {
    dev: "ऋछ् (ऋछँ) मूर्तिभावे तुदादिः",
    rom: "ṛch (ṛchaṁ) mūrtibhāve tudādiḥ"
  },
  'qj1_qjaz_BvAxiH_upArjane': {
    dev: "ऋज् (ऋजँ) उपार्जने भ्वादिः",
    rom: "ṛj (ṛjaṁ) upārjane bhvādiḥ"
  },
  'qj1_qjaz_BvAxiH_gawO': {
    dev: "ऋज् (ऋजँ) गतौ भ्वादिः",
    rom: "ṛj (ṛjaṁ) gatau bhvādiḥ"
  },
  'qj1_qjaz_BvAxiH_sWAnArjane': {
    dev: "ऋज् (ऋजँ) स्थानार्जने भ्वादिः",
    rom: "ṛj (ṛjaṁ) sthānārjane bhvādiḥ"
  },
  'qj2_qjiz_BvAxiH_Barjane': {
    dev: "ऋज् (ऋजिँ) भर्जने भ्वादिः",
    rom: "ṛj (ṛjiṁ) bharjane bhvādiḥ"
  },
  'qN1_qNuz_wanAxiH_gawO': {
    dev: "ऋण् (ऋणुँ) गतौ तनादिः",
    rom: "ṛṇ (ṛṇuṁ) gatau tanādiḥ"
  },
  'qN1_qNuz_wanAxiH_xIpwO': {
    dev: "ऋण् (ऋणुँ) दीप्तौ तनादिः",
    rom: "ṛṇ (ṛṇuṁ) dīptau tanādiḥ"
  },
  'qX1_qXuz_xivAxiH_vqxXO': {
    dev: "ऋध् (ऋधुँ) वृद्धौ दिवादिः",
    rom: "ṛdh (ṛdhuṁ) vṛddhau divādiḥ"
  },
  'qX2_qXuz_svAxiH_vqxXO': {
    dev: "ऋध् (ऋधुँ) वृद्धौ स्वादिः",
    rom: "ṛdh (ṛdhuṁ) vṛddhau svādiḥ"
  },
  'qnP1_qnPaz_wuxAxiH_hiMsAyAm': {
    dev: "ऋन्फ् (ऋन्फँ) हिंसायाम् तुदादिः",
    rom: "ṛnph (ṛnphaṁ) hiṃsāyām tudādiḥ"
  },
  'qP1_qPaz_wuxAxiH_hiMsAyAm': {
    dev: "ऋफ् (ऋफँ) हिंसायाम् तुदादिः",
    rom: "ṛph (ṛphaṁ) hiṃsāyām tudādiḥ"
  },
  'qR1_qRIz_wuxAxiH_gawO': {
    dev: "ऋष् (ऋषीँ) गतौ तुदादिः",
    rom: "ṛṣ (ṛṣīṁ) gatau tudādiḥ"
  },
  'qh1_qhaz_wuxAxiH_kawWane': {
    dev: "ऋह् (ऋहँ) कत्थने तुदादिः",
    rom: "ṛh (ṛhaṁ) katthane tudādiḥ"
  },
  'qh1_qhaz_wuxAxiH_xAne': {
    dev: "ऋह् (ऋहँ) दाने तुदादिः",
    rom: "ṛh (ṛhaṁ) dāne tudādiḥ"
  },
  'qh1_qhaz_wuxAxiH_yuxXe': {
    dev: "ऋह् (ऋहँ) युद्धे तुदादिः",
    rom: "ṛh (ṛhaṁ) yuddhe tudādiḥ"
  },
  'qh1_qhaz_wuxAxiH_hiMsAyAm': {
    dev: "ऋह् (ऋहँ) हिंसायाम् तुदादिः",
    rom: "ṛh (ṛhaṁ) hiṃsāyām tudādiḥ"
  },
  'Q1_Q_kryAxiH_gawO': {
    dev: "ॠ (ॠ) गतौ क्र्यादिः",
    rom: "ṝ (ṝ) gatau kryādiḥ"
  },
  'ej1_ejqz_BvAxiH_kampane': {
    dev: "एज् (एजृँ) कम्पने भ्वादिः",
    rom: "ej (ejṛṁ) kampane bhvādiḥ"
  },
  'ej2_ejqz_BvAxiH_xIpwO': {
    dev: "एज् (एजृँ) दीप्तौ भ्वादिः",
    rom: "ej (ejṛṁ) dīptau bhvādiḥ"
  },
  'eT1_eTaz_BvAxiH_vibAXAyAm': {
    dev: "एठ् (एठँ) विबाधायाम् भ्वादिः",
    rom: "eṭh (eṭhaṁ) vibādhāyām bhvādiḥ"
  },
  'eX1_eXaz_BvAxiH_vqxXO': {
    dev: "एध् (एधँ) वृद्धौ भ्वादिः",
    rom: "edh (edhaṁ) vṛddhau bhvādiḥ"
  },
  'ev1_evqz_BvAxiH_sevane': {
    dev: "एव् (एवृँ) सेवने भ्वादिः",
    rom: "ev (evṛṁ) sevane bhvādiḥ"
  },
  'eR1_eRqz_BvAxiH_gawO': {
    dev: "एष् (एषृँ) गतौ भ्वादिः",
    rom: "eṣ (eṣṛṁ) gatau bhvādiḥ"
  },
  'eR1_eRqz_BvAxiH_prayawne': {
    dev: "एष् (एषृँ) प्रयत्ने भ्वादिः",
    rom: "eṣ (eṣṛṁ) prayatne bhvādiḥ"
  },
  'oK1_oKqz_BvAxiH_alamarWe': {
    dev: "ओख् (ओखृँ) अलमर्थे भ्वादिः",
    rom: "okh (okhṛṁ) alamarthe bhvādiḥ"
  },
  'oK1_oKqz_BvAxiH_SoRaNe': {
    dev: "ओख् (ओखृँ) शोषणे भ्वादिः",
    rom: "okh (okhṛṁ) śoṣaṇe bhvādiḥ"
  },
  'oN1_oNqz_BvAxiH_apanayane': {
    dev: "ओण् (ओणृँ) अपनयने भ्वादिः",
    rom: "oṇ (oṇṛṁ) apanayane bhvādiḥ"
  },
  'kak1_kakaz_BvAxiH_lOlye': {
    dev: "कक् (ककँ) लौल्ये भ्वादिः",
    rom: "kak (kakaṁ) laulye bhvādiḥ"
  },
  'kak2_kakiz_BvAxiH_gawO': {
    dev: "कक् (ककिँ) गतौ भ्वादिः",
    rom: "kak (kakiṁ) gatau bhvādiḥ"
  },
  'kakK1_kakKaz_BvAxiH_hasane': {
    dev: "कक्ख् (कक्खँ) हसने भ्वादिः",
    rom: "kakkh (kakkhaṁ) hasane bhvādiḥ"
  },
  'kaK1_kaKaz_BvAxiH_hasane': {
    dev: "कख् (कखँ) हसने भ्वादिः",
    rom: "kakh (kakhaṁ) hasane bhvādiḥ"
  },
  'kaK2_kaKez_BvAxiH_hasane': {
    dev: "कख् (कखेँ) हसने भ्वादिः",
    rom: "kakh (kakheṁ) hasane bhvādiḥ"
  },
  'kag1_kagez_BvAxiH_anekArWawve': {
    dev: "कग् (कगेँ) अनेकार्थत्वे भ्वादिः",
    rom: "kag (kageṁ) anekārthatve bhvādiḥ"
  },
  'kac1_kacaz_BvAxiH_banXane': {
    dev: "कच् (कचँ) बन्धने भ्वादिः",
    rom: "kac (kacaṁ) bandhane bhvādiḥ"
  },
  'kac2_kaciz_BvAxiH_xIpwO': {
    dev: "कच् (कचिँ) दीप्तौ भ्वादिः",
    rom: "kac (kaciṁ) dīptau bhvādiḥ"
  },
  'kac2_kaciz_BvAxiH_banXane': {
    dev: "कच् (कचिँ) बन्धने भ्वादिः",
    rom: "kac (kaciṁ) bandhane bhvādiḥ"
  },
  'kaj1_kajaz_BvAxiH_maxe': {
    dev: "कज् (कजँ) मदे भ्वादिः",
    rom: "kaj (kajaṁ) made bhvādiḥ"
  },
  'kat3_kataz_BvAxiH_gawO': {
    dev: "कट् (कटँ) गतौ भ्वादिः",
    rom: "kaṭ (kaṭaṁ) gatau bhvādiḥ"
  },
  'kat2_katIz_BvAxiH_gawO': {
    dev: "कट् (कटीँ) गतौ भ्वादिः",
    rom: "kaṭ (kaṭīṁ) gatau bhvādiḥ"
  },
  'kat1_katez_BvAxiH_AvaraNe': {
    dev: "कट् (कटेँ) आवरणे भ्वादिः",
    rom: "kaṭ (kaṭeṁ) āvaraṇe bhvādiḥ"
  },
  'kat1_katez_BvAxiH_varRAyAm': {
    dev: "कट् (कटेँ) वर्षायाम् भ्वादिः",
    rom: "kaṭ (kaṭeṁ) varṣāyām bhvādiḥ"
  },
  'kaT1_kaTaz_BvAxiH_kqcCrajIvane': {
    dev: "कठ् (कठँ) कृच्छ्रजीवने भ्वादिः",
    rom: "kaṭh (kaṭhaṁ) kṛcchrajīvane bhvādiḥ"
  },
  'kaT1_kaTaz_BvAxiH_nivAse': {
    dev: "कठ् (कठँ) निवासे भ्वादिः",
    rom: "kaṭh (kaṭhaṁ) nivāse bhvādiḥ"
  },
  'kaT1_kaTaz_BvAxiH_maxe': {
    dev: "कठ् (कठँ) मदे भ्वादिः",
    rom: "kaṭh (kaṭhaṁ) made bhvādiḥ"
  },
  'kaT3_kaTiz_curAxiH_Soke': {
    dev: "कठ् (कठिँ) शोके चुरादिः",
    rom: "kaṭh (kaṭhiṁ) śoke curādiḥ"
  },
  'kaT2_kaTiz_BvAxiH_Soke': {
    dev: "कठ् (कठिँ) शोके भ्वादिः",
    rom: "kaṭh (kaṭhiṁ) śoke bhvādiḥ"
  },
  'kad3_kadaz_wuxAxiH_Gasane': {
    dev: "कड् (कडँ) घसने तुदादिः",
    rom: "kaḍ (kaḍaṁ) ghasane tudādiḥ"
  },
  'kad3_kadaz_wuxAxiH_maxe': {
    dev: "कड् (कडँ) मदे तुदादिः",
    rom: "kaḍ (kaḍaṁ) made tudādiḥ"
  },
  'kad1_kadaz_BvAxiH_maxe': {
    dev: "कड् (कडँ) मदे भ्वादिः",
    rom: "kaḍ (kaḍaṁ) made bhvādiḥ"
  },
  'kad4_kadiz_curAxiH_Bexane': {
    dev: "कड् (कडिँ) भेदने चुरादिः",
    rom: "kaḍ (kaḍiṁ) bhedane curādiḥ"
  },
  'kad2_kadiz_BvAxiH_maxe': {
    dev: "कड् (कडिँ) मदे भ्वादिः",
    rom: "kaḍ (kaḍiṁ) made bhvādiḥ"
  },
  'kaN1_kaNaz_BvAxiH_gawO': {
    dev: "कण् (कणँ) गतौ भ्वादिः",
    rom: "kaṇ (kaṇaṁ) gatau bhvādiḥ"
  },
  'kaN2_kaNaz_curAxiH_nimIlane': {
    dev: "कण् (कणँ) निमीलने चुरादिः",
    rom: "kaṇ (kaṇaṁ) nimīlane curādiḥ"
  },
  'kaN1_kaNaz_BvAxiH_Sabxe': {
    dev: "कण् (कणँ) शब्दे भ्वादिः",
    rom: "kaṇ (kaṇaṁ) śabde bhvādiḥ"
  },
  'kaNd1_kaNdaz_BvAxiH_maxe': {
    dev: "कण्ड् (कण्डँ) मदे भ्वादिः",
    rom: "kaṇḍ (kaṇḍaṁ) made bhvādiḥ"
  },
  'kawW1_kawWaz_BvAxiH_SlAGAyAm': {
    dev: "कत्थ् (कत्थँ) श्लाघायाम् भ्वादिः",
    rom: "katth (katthaṁ) ślāghāyām bhvādiḥ"
  },
  'kawra1_kawra_curAxiH_SEWilye': {
    dev: "कत्र (कत्र) शैथिल्ये चुरादिः",
    rom: "katra (katra) śaithilye curādiḥ"
  },
  'kaWa1_kaWa_curAxiH_vAkyaprabanXe': {
    dev: "कथ (कथ) वाक्यप्रबन्धे चुरादिः",
    rom: "katha (katha) vākyaprabandhe curādiḥ"
  },
  'kaW1_kaWaz_BvAxiH_hiMsAyAm': {
    dev: "कथ् (कथँ) हिंसायाम् भ्वादिः",
    rom: "kath (kathaṁ) hiṃsāyām bhvādiḥ"
  },
  'kax1_kaxiz_BvAxiH_AhvAne': {
    dev: "कद् (कदिँ) आह्वाने भ्वादिः",
    rom: "kad (kadiṁ) āhvāne bhvādiḥ"
  },
  'kax1_kaxiz_BvAxiH_roxane': {
    dev: "कद् (कदिँ) रोदने भ्वादिः",
    rom: "kad (kadiṁ) rodane bhvādiḥ"
  },
  'kax2_kaxiz_BvAxiH_vEklavye': {
    dev: "कद् (कदिँ) वैक्लव्ये भ्वादिः",
    rom: "kad (kadiṁ) vaiklavye bhvādiḥ"
  },
  'kaxd1_kaxdaz_BvAxiH_kArkaSye': {
    dev: "कद्ड् (कद्डँ) कार्कश्ये भ्वादिः",
    rom: "kadḍ (kadḍaṁ) kārkaśye bhvādiḥ"
  },
  'kan1_kanIz_BvAxiH_kAnwO': {
    dev: "कन् (कनीँ) कान्तौ भ्वादिः",
    rom: "kan (kanīṁ) kāntau bhvādiḥ"
  },
  'kan1_kanIz_BvAxiH_gawO': {
    dev: "कन् (कनीँ) गतौ भ्वादिः",
    rom: "kan (kanīṁ) gatau bhvādiḥ"
  },
  'kan1_kanIz_BvAxiH_xIpwO': {
    dev: "कन् (कनीँ) दीप्तौ भ्वादिः",
    rom: "kan (kanīṁ) dīptau bhvādiḥ"
  },
  'kap1_kapiz_BvAxiH_calane': {
    dev: "कप् (कपिँ) चलने भ्वादिः",
    rom: "kap (kapiṁ) calane bhvādiḥ"
  },
  'kab1_kabqz_BvAxiH_varNe': {
    dev: "कब् (कबृँ) वर्णे भ्वादिः",
    rom: "kab (kabṛṁ) varṇe bhvādiḥ"
  },
  'kam1_kamuz_BvAxiH_kAnwO': {
    dev: "कम् (कमुँ) कान्तौ भ्वादिः",
    rom: "kam (kamuṁ) kāntau bhvādiḥ"
  },
  'karj1_karjaz_BvAxiH_vyaWane': {
    dev: "कर्ज् (कर्जँ) व्यथने भ्वादिः",
    rom: "karj (karjaṁ) vyathane bhvādiḥ"
  },
  'karNa1_karNa_curAxiH_Bexane': {
    dev: "कर्ण (कर्ण) भेदने चुरादिः",
    rom: "karṇa (karṇa) bhedane curādiḥ"
  },
  'karwq1_karwq_curAxiH_SEWilye': {
    dev: "कर्तृ (कर्तृ) शैथिल्ये चुरादिः",
    rom: "kartṛ (kartṛ) śaithilye curādiḥ"
  },
  'karx1_karxaz_BvAxiH_kuwsiwe_Sabxe': {
    dev: "कर्द् (कर्दँ) कुत्सिते_शब्दे भ्वादिः",
    rom: "kard (kardaṁ) kutsite_śabde bhvādiḥ"
  },
  'karb1_karbaz_BvAxiH_gawO': {
    dev: "कर्ब् (कर्बँ) गतौ भ्वादिः",
    rom: "karb (karbaṁ) gatau bhvādiḥ"
  },
  'karv1_karvaz_BvAxiH_xarpe': {
    dev: "कर्व् (कर्वँ) दर्पे भ्वादिः",
    rom: "karv (karvaṁ) darpe bhvādiḥ"
  },
  'kala1_kala_curAxiH_gawO': {
    dev: "कल (कल) गतौ चुरादिः",
    rom: "kala (kala) gatau curādiḥ"
  },
  'kala1_kala_curAxiH_safKyAne': {
    dev: "कल (कल) सङ्ख्याने चुरादिः",
    rom: "kala (kala) saṅkhyāne curādiḥ"
  },
  'kal2_kalaz_curAxiH_kRepe': {
    dev: "कल् (कलँ) क्षेपे चुरादिः",
    rom: "kal (kalaṁ) kṣepe curādiḥ"
  },
  'kal1_kalaz_BvAxiH_Sabxe': {
    dev: "कल् (कलँ) शब्दे भ्वादिः",
    rom: "kal (kalaṁ) śabde bhvādiḥ"
  },
  'kal1_kalaz_BvAxiH_safKyAne': {
    dev: "कल् (कलँ) सङ्ख्याने भ्वादिः",
    rom: "kal (kalaṁ) saṅkhyāne bhvādiḥ"
  },
  'kall1_kallaz_BvAxiH_avyakwe_Sabxe': {
    dev: "कल्ल् (कल्लँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "kall (kallaṁ) avyakte_śabde bhvādiḥ"
  },
  'kav1_kavaz_BvAxiH_Sabxe': {
    dev: "कव् (कवँ) शब्दे भ्वादिः",
    rom: "kav (kavaṁ) śabde bhvādiḥ"
  },
  'kaS1_kaSiz_curAxiH_BARArWe': {
    dev: "कश् (कशिँ) भाषार्थे चुरादिः",
    rom: "kaś (kaśiṁ) bhāṣārthe curādiḥ"
  },
  'kaR1_kaRaz_BvAxiH_hiMsAyAm': {
    dev: "कष् (कषँ) हिंसायाम् भ्वादिः",
    rom: "kaṣ (kaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'kas1_kasaz_BvAxiH_gawO': {
    dev: "कस् (कसँ) गतौ भ्वादिः",
    rom: "kas (kasaṁ) gatau bhvādiḥ"
  },
  'kas1_kasaz_BvAxiH_SAsane': {
    dev: "कस् (कसँ) शासने भ्वादिः",
    rom: "kas (kasaṁ) śāsane bhvādiḥ"
  },
  'kas2_kasiz_axAxiH_gawO': {
    dev: "कस् (कसिँ) गतौ अदादिः",
    rom: "kas (kasiṁ) gatau adādiḥ"
  },
  'kas2_kasiz_axAxiH_SAsane': {
    dev: "कस् (कसिँ) शासने अदादिः",
    rom: "kas (kasiṁ) śāsane adādiḥ"
  },
  'kAkR1_kAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "काक्ष् (काक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "kākṣ (kākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'kAc1_kAciz_BvAxiH_xIpwO': {
    dev: "काच् (काचिँ) दीप्तौ भ्वादिः",
    rom: "kāc (kāciṁ) dīptau bhvādiḥ"
  },
  'kAc1_kAciz_BvAxiH_banXane': {
    dev: "काच् (काचिँ) बन्धने भ्वादिः",
    rom: "kāc (kāciṁ) bandhane bhvādiḥ"
  },
  'kAd1_kAdqz_BvAxiH_anAxare': {
    dev: "काड् (काडृँ) अनादरे भ्वादिः",
    rom: "kāḍ (kāḍṛṁ) anādare bhvādiḥ"
  },
  'kAS2_kASqz_xivAxiH_xIpwO': {
    dev: "काश् (काशृँ) दीप्तौ दिवादिः",
    rom: "kāś (kāśṛṁ) dīptau divādiḥ"
  },
  'kAS1_kASqz_BvAxiH_xIpwO': {
    dev: "काश् (काशृँ) दीप्तौ भ्वादिः",
    rom: "kāś (kāśṛṁ) dīptau bhvādiḥ"
  },
  'kAs1_kAsqz_BvAxiH_SabxakuwsAyAm': {
    dev: "कास् (कासृँ) शब्दकुत्सायाम् भ्वादिः",
    rom: "kās (kāsṛṁ) śabdakutsāyām bhvādiḥ"
  },
  'ki1_ki_juhowyAxiH_jFAne': {
    dev: "कि (कि) ज्ञाने जुहोत्यादिः",
    rom: "ki (ki) jñāne juhotyādiḥ"
  },
  'kit1_kitaz_BvAxiH_uwwrAse': {
    dev: "किट् (किटँ) उत्त्रासे भ्वादिः",
    rom: "kiṭ (kiṭaṁ) uttrāse bhvādiḥ"
  },
  'kit1_kitaz_BvAxiH_gawO': {
    dev: "किट् (किटँ) गतौ भ्वादिः",
    rom: "kiṭ (kiṭaṁ) gatau bhvādiḥ"
  },
  'kiw1_kiwaz_BvAxiH_nivAse': {
    dev: "कित् (कितँ) निवासे भ्वादिः",
    rom: "kit (kitaṁ) nivāse bhvādiḥ"
  },
  'kiw1_kiwaz_BvAxiH_rogApanayane': {
    dev: "कित् (कितँ) रोगापनयने भ्वादिः",
    rom: "kit (kitaṁ) rogāpanayane bhvādiḥ"
  },
  'kil1_kilaz_wuxAxiH_krIdAyAm': {
    dev: "किल् (किलँ) क्रीडायाम् तुदादिः",
    rom: "kil (kilaṁ) krīḍāyām tudādiḥ"
  },
  'kil2_kilaz_curAxiH_kRepe': {
    dev: "किल् (किलँ) क्षेपे चुरादिः",
    rom: "kil (kilaṁ) kṣepe curādiḥ"
  },
  'kil1_kilaz_wuxAxiH_SvEwye': {
    dev: "किल् (किलँ) श्वैत्ये तुदादिः",
    rom: "kil (kilaṁ) śvaitye tudādiḥ"
  },
  'kiRk1_kiRkaz_curAxiH_hiMsAyAm': {
    dev: "किष्क् (किष्कँ) हिंसायाम् चुरादिः",
    rom: "kiṣk (kiṣkaṁ) hiṃsāyām curādiḥ"
  },
  'kIt1_kItaz_curAxiH_varaNe': {
    dev: "कीट् (कीटँ) वरणे चुरादिः",
    rom: "kīṭ (kīṭaṁ) varaṇe curādiḥ"
  },
  'kIrwa1_kIrwa_curAxiH_-': {
    dev: "कीर्त (कीर्त) - चुरादिः",
    rom: "kīrta (kīrta) - curādiḥ"
  },
  'kIl1_kIlaz_BvAxiH_banXane': {
    dev: "कील् (कीलँ) बन्धने भ्वादिः",
    rom: "kīl (kīlaṁ) bandhane bhvādiḥ"
  },
  'ku2_ku_axAxiH_Sabxe': {
    dev: "कु (कु) शब्दे अदादिः",
    rom: "ku (ku) śabde adādiḥ"
  },
  'ku3_kuf_wuxAxiH_Sabxe': {
    dev: "कु (कुङ्) शब्दे तुदादिः",
    rom: "ku (kuṅ) śabde tudādiḥ"
  },
  'ku1_kuf_BvAxiH_Sabxe': {
    dev: "कु (कुङ्) शब्दे भ्वादिः",
    rom: "ku (kuṅ) śabde bhvādiḥ"
  },
  'kuk1_kukaz_BvAxiH_AxAne': {
    dev: "कुक् (कुकँ) आदाने भ्वादिः",
    rom: "kuk (kukaṁ) ādāne bhvādiḥ"
  },
  'kuc1_kucaz_BvAxiH_kOtilye': {
    dev: "कुच् (कुचँ) कौटिल्ये भ्वादिः",
    rom: "kuc (kucaṁ) kauṭilye bhvādiḥ"
  },
  'kuc2_kucaz_BvAxiH_wAre': {
    dev: "कुच् (कुचँ) तारे भ्वादिः",
    rom: "kuc (kucaṁ) tāre bhvādiḥ"
  },
  'kuc1_kucaz_BvAxiH_prawiRtamBe': {
    dev: "कुच् (कुचँ) प्रतिष्टम्भे भ्वादिः",
    rom: "kuc (kucaṁ) pratiṣṭambhe bhvādiḥ"
  },
  'kuc1_kucaz_BvAxiH_vileKane': {
    dev: "कुच् (कुचँ) विलेखने भ्वादिः",
    rom: "kuc (kucaṁ) vilekhane bhvādiḥ"
  },
  'kuc1_kucaz_BvAxiH_Sabxe': {
    dev: "कुच् (कुचँ) शब्दे भ्वादिः",
    rom: "kuc (kucaṁ) śabde bhvādiḥ"
  },
  'kuc2_kucaz_wuxAxiH_safkocane': {
    dev: "कुच् (कुचँ) सङ्कोचने तुदादिः",
    rom: "kuc (kucaṁ) saṅkocane tudādiḥ"
  },
  'kuc1_kucaz_BvAxiH_samparcane': {
    dev: "कुच् (कुचँ) सम्पर्चने भ्वादिः",
    rom: "kuc (kucaṁ) samparcane bhvādiḥ"
  },
  'kuj1_kujuz_BvAxiH_sweyakaraNe': {
    dev: "कुज् (कुजुँ) स्तेयकरणे भ्वादिः",
    rom: "kuj (kujuṁ) steyakaraṇe bhvādiḥ"
  },
  'kut1_kutaz_wuxAxiH_kOtilye': {
    dev: "कुट् (कुटँ) कौटिल्ये तुदादिः",
    rom: "kuṭ (kuṭaṁ) kauṭilye tudādiḥ"
  },
  'kut2_kutaz_curAxiH_prawApane': {
    dev: "कुट् (कुटँ) प्रतापने चुरादिः",
    rom: "kuṭ (kuṭaṁ) pratāpane curādiḥ"
  },
  'kuT1_kuTiz_BvAxiH_gawiprawiGAwe': {
    dev: "कुठ् (कुठिँ) गतिप्रतिघाते भ्वादिः",
    rom: "kuṭh (kuṭhiṁ) gatipratighāte bhvādiḥ"
  },
  'kuT1_kuTiz_BvAxiH_vEkalye': {
    dev: "कुठ् (कुठिँ) वैकल्ये भ्वादिः",
    rom: "kuṭh (kuṭhiṁ) vaikalye bhvādiḥ"
  },
  'kud3_kudaz_wuxAxiH_bAlye': {
    dev: "कुड् (कुडँ) बाल्ये तुदादिः",
    rom: "kuḍ (kuḍaṁ) bālye tudādiḥ"
  },
  'kud2_kudiz_BvAxiH_xAhe': {
    dev: "कुड् (कुडिँ) दाहे भ्वादिः",
    rom: "kuḍ (kuḍiṁ) dāhe bhvādiḥ"
  },
  'kud4_kudiz_curAxiH_rakRaNe': {
    dev: "कुड् (कुडिँ) रक्षणे चुरादिः",
    rom: "kuḍ (kuḍiṁ) rakṣaṇe curādiḥ"
  },
  'kud1_kudiz_BvAxiH_vEkalye': {
    dev: "कुड् (कुडिँ) वैकल्ये भ्वादिः",
    rom: "kuḍ (kuḍiṁ) vaikalye bhvādiḥ"
  },
  'kuNa1_kuNa_curAxiH_AmanwraNe': {
    dev: "कुण (कुण) आमन्त्रणे चुरादिः",
    rom: "kuṇa (kuṇa) āmantraṇe curādiḥ"
  },
  'kuN1_kuNaz_wuxAxiH_upakaraNe': {
    dev: "कुण् (कुणँ) उपकरणे तुदादिः",
    rom: "kuṇ (kuṇaṁ) upakaraṇe tudādiḥ"
  },
  'kuN1_kuNaz_wuxAxiH_Sabxe': {
    dev: "कुण् (कुणँ) शब्दे तुदादिः",
    rom: "kuṇ (kuṇaṁ) śabde tudādiḥ"
  },
  'kuwt1_kuwtaz_curAxiH_kuwsAyAm': {
    dev: "कुत्ट् (कुत्टँ) कुत्सायाम् चुरादिः",
    rom: "kutṭ (kutṭaṁ) kutsāyām curādiḥ"
  },
  'kuwt1_kuwtaz_curAxiH_Cexane': {
    dev: "कुत्ट् (कुत्टँ) छेदने चुरादिः",
    rom: "kutṭ (kutṭaṁ) chedane curādiḥ"
  },
  'kuwt1_kuwtaz_curAxiH_prawApane': {
    dev: "कुत्ट् (कुत्टँ) प्रतापने चुरादिः",
    rom: "kutṭ (kutṭaṁ) pratāpane curādiḥ"
  },
  'kuwt1_kuwtaz_curAxiH_Barwsane': {
    dev: "कुत्ट् (कुत्टँ) भर्त्सने चुरादिः",
    rom: "kutṭ (kutṭaṁ) bhartsane curādiḥ"
  },
  'kuws1_kuwsaz_curAxiH_avakRepaNe': {
    dev: "कुत्स् (कुत्सँ) अवक्षेपणे चुरादिः",
    rom: "kuts (kutsaṁ) avakṣepaṇe curādiḥ"
  },
  'kuW2_kuWaz_xivAxiH_pUwIBAve': {
    dev: "कुथ् (कुथँ) पूतीभावे दिवादिः",
    rom: "kuth (kuthaṁ) pūtībhāve divādiḥ"
  },
  'kuW1_kuWiz_BvAxiH_safkleSane': {
    dev: "कुथ् (कुथिँ) सङ्क्लेशने भ्वादिः",
    rom: "kuth (kuthiṁ) saṅkleśane bhvādiḥ"
  },
  'kuW1_kuWiz_BvAxiH_hiMsAyAm': {
    dev: "कुथ् (कुथिँ) हिंसायाम् भ्वादिः",
    rom: "kuth (kuthiṁ) hiṃsāyām bhvādiḥ"
  },
  'kuxr1_kuxriz_curAxiH_anqwaBARaNe': {
    dev: "कुद्र् (कुद्रिँ) अनृतभाषणे चुरादिः",
    rom: "kudr (kudriṁ) anṛtabhāṣaṇe curādiḥ"
  },
  'kunc1_kuncaz_BvAxiH_alpIBAve': {
    dev: "कुन्च् (कुन्चँ) अल्पीभावे भ्वादिः",
    rom: "kunc (kuncaṁ) alpībhāve bhvādiḥ"
  },
  'kunc1_kuncaz_BvAxiH_kOtilye': {
    dev: "कुन्च् (कुन्चँ) कौटिल्ये भ्वादिः",
    rom: "kunc (kuncaṁ) kauṭilye bhvādiḥ"
  },
  'kunc1_kuncaz_BvAxiH_gawikOtilye': {
    dev: "कुन्च् (कुन्चँ) गतिकौटिल्ये भ्वादिः",
    rom: "kunc (kuncaṁ) gatikauṭilye bhvādiḥ"
  },
  'kunW1_kunWaz_kryAxiH_saMSleRaNe': {
    dev: "कुन्थ् (कुन्थँ) संश्लेषणे क्र्यादिः",
    rom: "kunth (kunthaṁ) saṃśleṣaṇe kryādiḥ"
  },
  'kup1_kupaz_xivAxiH_kroXe': {
    dev: "कुप् (कुपँ) क्रोधे दिवादिः",
    rom: "kup (kupaṁ) krodhe divādiḥ"
  },
  'kup2_kupaz_curAxiH_BARArWe': {
    dev: "कुप् (कुपँ) भाषार्थे चुरादिः",
    rom: "kup (kupaṁ) bhāṣārthe curādiḥ"
  },
  'kup2_kupaz_curAxiH_BAsArWe': {
    dev: "कुप् (कुपँ) भासार्थे चुरादिः",
    rom: "kup (kupaṁ) bhāsārthe curādiḥ"
  },
  'kup3_kupiz_curAxiH_CAxane': {
    dev: "कुप् (कुपिँ) छादने चुरादिः",
    rom: "kup (kupiṁ) chādane curādiḥ"
  },
  'kub1_kubiz_BvAxiH_arxane': {
    dev: "कुब् (कुबिँ) अर्दने भ्वादिः",
    rom: "kub (kubiṁ) ardane bhvādiḥ"
  },
  'kub2_kubiz_curAxiH_AcCAxane': {
    dev: "कुब् (कुबिँ) आच्छादने चुरादिः",
    rom: "kub (kubiṁ) ācchādane curādiḥ"
  },
  'kub1_kubiz_BvAxiH_AcCAxane': {
    dev: "कुब् (कुबिँ) आच्छादने भ्वादिः",
    rom: "kub (kubiṁ) ācchādane bhvādiḥ"
  },
  'kumAra1_kumAra_curAxiH_krIdAyAm': {
    dev: "कुमार (कुमार) क्रीडायाम् चुरादिः",
    rom: "kumāra (kumāra) krīḍāyām curādiḥ"
  },
  'kur1_kuraz_wuxAxiH_Sabxe': {
    dev: "कुर् (कुरँ) शब्दे तुदादिः",
    rom: "kur (kuraṁ) śabde tudādiḥ"
  },
  'kurx1_kurxaz_BvAxiH_krIdAyAm': {
    dev: "कुर्द् (कुर्दँ) क्रीडायाम् भ्वादिः",
    rom: "kurd (kurdaṁ) krīḍāyām bhvādiḥ"
  },
  'kul1_kulaz_BvAxiH_banXane': {
    dev: "कुल् (कुलँ) बन्धने भ्वादिः",
    rom: "kul (kulaṁ) bandhane bhvādiḥ"
  },
  'kul1_kulaz_BvAxiH_saMnwAne': {
    dev: "कुल् (कुलँ) संन्ताने भ्वादिः",
    rom: "kul (kulaṁ) saṃntāne bhvādiḥ"
  },
  'kul1_kulaz_BvAxiH_saMswyAne': {
    dev: "कुल् (कुलँ) संस्त्याने भ्वादिः",
    rom: "kul (kulaṁ) saṃstyāne bhvādiḥ"
  },
  'kuS1_kuSiz_curAxiH_BARArWe': {
    dev: "कुश् (कुशिँ) भाषार्थे चुरादिः",
    rom: "kuś (kuśiṁ) bhāṣārthe curādiḥ"
  },
  'kuS1_kuSiz_curAxiH_BAsArWe': {
    dev: "कुश् (कुशिँ) भासार्थे चुरादिः",
    rom: "kuś (kuśiṁ) bhāsārthe curādiḥ"
  },
  'kuR1_kuRaz_kryAxiH_niRkarRe': {
    dev: "कुष् (कुषँ) निष्कर्षे क्र्यादिः",
    rom: "kuṣ (kuṣaṁ) niṣkarṣe kryādiḥ"
  },
  'kus1_kusaz_xivAxiH_SleRaNe': {
    dev: "कुस् (कुसँ) श्लेषणे दिवादिः",
    rom: "kus (kusaṁ) śleṣaṇe divādiḥ"
  },
  'kus2_kusiz_curAxiH_BARArWe': {
    dev: "कुस् (कुसिँ) भाषार्थे चुरादिः",
    rom: "kus (kusiṁ) bhāṣārthe curādiḥ"
  },
  'kus2_kusiz_curAxiH_BAsArWe': {
    dev: "कुस् (कुसिँ) भासार्थे चुरादिः",
    rom: "kus (kusiṁ) bhāsārthe curādiḥ"
  },
  'kusm1_kusmaz_curAxiH_kusmayane': {
    dev: "कुस्म् (कुस्मँ) कुस्मयने चुरादिः",
    rom: "kusm (kusmaṁ) kusmayane curādiḥ"
  },
  'kuha1_kuha_curAxiH_vismApane': {
    dev: "कुह (कुह) विस्मापने चुरादिः",
    rom: "kuha (kuha) vismāpane curādiḥ"
  },
  'kUj1_kUjaz_BvAxiH_avyakwe_Sabxe': {
    dev: "कूज् (कूजँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "kūj (kūjaṁ) avyakte_śabde bhvādiḥ"
  },
  'kUta1_kUta_curAxiH_pariwApe': {
    dev: "कूट (कूट) परितापे चुरादिः",
    rom: "kūṭa (kūṭa) paritāpe curādiḥ"
  },
  'kUt1_kUtaz_curAxiH_apraxAne': {
    dev: "कूट् (कूटँ) अप्रदाने चुरादिः",
    rom: "kūṭ (kūṭaṁ) apradāne curādiḥ"
  },
  'kUt1_kUtaz_curAxiH_apramAxe': {
    dev: "कूट् (कूटँ) अप्रमादे चुरादिः",
    rom: "kūṭ (kūṭaṁ) apramāde curādiḥ"
  },
  'kUN1_kUNaz_curAxiH_safkocane': {
    dev: "कूण् (कूणँ) सङ्कोचने चुरादिः",
    rom: "kūṇ (kūṇaṁ) saṅkocane curādiḥ"
  },
  'kUl1_kUlaz_BvAxiH_AvaraNe': {
    dev: "कूल् (कूलँ) आवरणे भ्वादिः",
    rom: "kūl (kūlaṁ) āvaraṇe bhvādiḥ"
  },
  'kq1_kqF_BvAxiH_karaNe': {
    dev: "कृ (कृञ्) करणे भ्वादिः",
    rom: "kṛ (kṛñ) karaṇe bhvādiḥ"
  },
  'kq3_dukqF_wanAxiH_karaNe': {
    dev: "कृ (डुकृञ्) करणे तनादिः",
    rom: "kṛ (ḍukṛñ) karaṇe tanādiḥ"
  },
  'kqd1_kqdaz_wuxAxiH_Ganawve': {
    dev: "कृड् (कृडँ) घनत्वे तुदादिः",
    rom: "kṛḍ (kṛḍaṁ) ghanatve tudādiḥ"
  },
  'kqw1_kqwIz_wuxAxiH_Cexane': {
    dev: "कृत् (कृतीँ) छेदने तुदादिः",
    rom: "kṛt (kṛtīṁ) chedane tudādiḥ"
  },
  'kqw2_kqwIz_ruXAxiH_veRtane': {
    dev: "कृत् (कृतीँ) वेष्टने रुधादिः",
    rom: "kṛt (kṛtīṁ) veṣṭane rudhādiḥ"
  },
  'kqpa1_kqpa_curAxiH_xOrbalye': {
    dev: "कृप (कृप) दौर्बल्ये चुरादिः",
    rom: "kṛpa (kṛpa) daurbalye curādiḥ"
  },
  'kqp1_kqpUz_BvAxiH_sAmarWye': {
    dev: "कृप् (कृपूँ) सामर्थ्ये भ्वादिः",
    rom: "kṛp (kṛpūṁ) sāmarthye bhvādiḥ"
  },
  'kqv1_kqviz_BvAxiH_karaNe': {
    dev: "कृव् (कृविँ) करणे भ्वादिः",
    rom: "kṛv (kṛviṁ) karaṇe bhvādiḥ"
  },
  'kqv1_kqviz_BvAxiH_hiMsAyAm': {
    dev: "कृव् (कृविँ) हिंसायाम् भ्वादिः",
    rom: "kṛv (kṛviṁ) hiṃsāyām bhvādiḥ"
  },
  'kqS1_kqSaz_xivAxiH_wanUkaraNe': {
    dev: "कृश् (कृशँ) तनूकरणे दिवादिः",
    rom: "kṛś (kṛśaṁ) tanūkaraṇe divādiḥ"
  },
  'kqR2_kqRaz_wuxAxiH_vileKane': {
    dev: "कृष् (कृषँ) विलेखने तुदादिः",
    rom: "kṛṣ (kṛṣaṁ) vilekhane tudādiḥ"
  },
  'kqR1_kqRaz_BvAxiH_vileKane': {
    dev: "कृष् (कृषँ) विलेखने भ्वादिः",
    rom: "kṛṣ (kṛṣaṁ) vilekhane bhvādiḥ"
  },
  'kQ1_kQ_wuxAxiH_vikRepe': {
    dev: "कॄ (कॄ) विक्षेपे तुदादिः",
    rom: "kṝ (kṝ) vikṣepe tudādiḥ"
  },
  'kQ3_kQ_kryAxiH_hiMsAyAm': {
    dev: "कॄ (कॄ) हिंसायाम् क्र्यादिः",
    rom: "kṝ (kṝ) hiṃsāyām kryādiḥ"
  },
  'kQ2_kQF_kryAxiH_hiMsAyAm': {
    dev: "कॄ (कॄञ्) हिंसायाम् क्र्यादिः",
    rom: "kṝ (kṝñ) hiṃsāyām kryādiḥ"
  },
  'kQw1_kQwaz_curAxiH_saMSabxane': {
    dev: "कॄत् (कॄतँ) संशब्दने चुरादिः",
    rom: "kṝt (kṝtaṁ) saṃśabdane curādiḥ"
  },
  'kewa1_kewa_curAxiH_AmanwraNe': {
    dev: "केत (केत) आमन्त्रणे चुरादिः",
    rom: "keta (keta) āmantraṇe curādiḥ"
  },
  'kewa1_kewa_curAxiH_viSrAvaNe': {
    dev: "केत (केत) विश्रावणे चुरादिः",
    rom: "keta (keta) viśrāvaṇe curādiḥ"
  },
  'kep1_kepqz_BvAxiH_kampane': {
    dev: "केप् (केपृँ) कम्पने भ्वादिः",
    rom: "kep (kepṛṁ) kampane bhvādiḥ"
  },
  'kel1_kelqz_BvAxiH_calane': {
    dev: "केल् (केलृँ) चलने भ्वादिः",
    rom: "kel (kelṛṁ) calane bhvādiḥ"
  },
  'kev1_kevqz_BvAxiH_sevane': {
    dev: "केव् (केवृँ) सेवने भ्वादिः",
    rom: "kev (kevṛṁ) sevane bhvādiḥ"
  },
  'kE1_kE_BvAxiH_Sabxe': {
    dev: "कै (कै) शब्दे भ्वादिः",
    rom: "kai (kai) śabde bhvādiḥ"
  },
  'knas1_knasuz_xivAxiH_kRaraNe': {
    dev: "क्नस् (क्नसुँ) क्षरणे दिवादिः",
    rom: "knas (knasuṁ) kṣaraṇe divādiḥ"
  },
  'knas1_knasuz_xivAxiH_xIpwO': {
    dev: "क्नस् (क्नसुँ) दीप्तौ दिवादिः",
    rom: "knas (knasuṁ) dīptau divādiḥ"
  },
  'knas1_knasuz_xivAxiH_hvaraNe': {
    dev: "क्नस् (क्नसुँ) ह्वरणे दिवादिः",
    rom: "knas (knasuṁ) hvaraṇe divādiḥ"
  },
  'knU1_knUF_kryAxiH_Sabxe': {
    dev: "क्नू (क्नूञ्) शब्दे क्र्यादिः",
    rom: "knū (knūñ) śabde kryādiḥ"
  },
  'knUy1_knUyIz_BvAxiH_unxe': {
    dev: "क्नूय् (क्नूयीँ) उन्दे भ्वादिः",
    rom: "knūy (knūyīṁ) unde bhvādiḥ"
  },
  'knUy1_knUyIz_BvAxiH_Sabxe': {
    dev: "क्नूय् (क्नूयीँ) शब्दे भ्वादिः",
    rom: "knūy (knūyīṁ) śabde bhvādiḥ"
  },
  'kmar1_kmaraz_BvAxiH_hUrcCane': {
    dev: "क्मर् (क्मरँ) हूर्च्छने भ्वादिः",
    rom: "kmar (kmaraṁ) hūrcchane bhvādiḥ"
  },
  'kraW2_kraWaz_curAxiH_hiMsAyAm': {
    dev: "क्रथ् (क्रथँ) हिंसायाम् चुरादिः",
    rom: "krath (krathaṁ) hiṃsāyām curādiḥ"
  },
  'kraW1_kraWaz_BvAxiH_hiMsAyAm': {
    dev: "क्रथ् (क्रथँ) हिंसायाम् भ्वादिः",
    rom: "krath (krathaṁ) hiṃsāyām bhvādiḥ"
  },
  'krax1_kraxaz_BvAxiH_vEklavye': {
    dev: "क्रद् (क्रदँ) वैक्लव्ये भ्वादिः",
    rom: "krad (kradaṁ) vaiklavye bhvādiḥ"
  },
  'krax2_kraxiz_BvAxiH_AhvAne': {
    dev: "क्रद् (क्रदिँ) आह्वाने भ्वादिः",
    rom: "krad (kradiṁ) āhvāne bhvādiḥ"
  },
  'krax2_kraxiz_BvAxiH_roxane': {
    dev: "क्रद् (क्रदिँ) रोदने भ्वादिः",
    rom: "krad (kradiṁ) rodane bhvādiḥ"
  },
  'krax3_kraxiz_BvAxiH_vEklavye': {
    dev: "क्रद् (क्रदिँ) वैक्लव्ये भ्वादिः",
    rom: "krad (kradiṁ) vaiklavye bhvādiḥ"
  },
  'kranx1_kranxaz_curAxiH_sAwawye': {
    dev: "क्रन्द् (क्रन्दँ) सातत्ये चुरादिः",
    rom: "krand (krandaṁ) sātatye curādiḥ"
  },
  'krap1_krapaz_BvAxiH_kqpAyAm': {
    dev: "क्रप् (क्रपँ) कृपायाम् भ्वादिः",
    rom: "krap (krapaṁ) kṛpāyām bhvādiḥ"
  },
  'krap1_krapaz_BvAxiH_gawO': {
    dev: "क्रप् (क्रपँ) गतौ भ्वादिः",
    rom: "krap (krapaṁ) gatau bhvādiḥ"
  },
  'kram1_kramuz_BvAxiH_pAxavikRepe': {
    dev: "क्रम् (क्रमुँ) पादविक्षेपे भ्वादिः",
    rom: "kram (kramuṁ) pādavikṣepe bhvādiḥ"
  },
  'krI1_dukrIF_kryAxiH_xravyavinimaye': {
    dev: "क्री (डुक्रीञ्) द्रव्यविनिमये क्र्यादिः",
    rom: "krī (ḍukrīñ) dravyavinimaye kryādiḥ"
  },
  'krId1_krIdqz_BvAxiH_vihAre': {
    dev: "क्रीड् (क्रीडृँ) विहारे भ्वादिः",
    rom: "krīḍ (krīḍṛṁ) vihāre bhvādiḥ"
  },
  'krud1_krudaz_wuxAxiH_nimajjane': {
    dev: "क्रुड् (क्रुडँ) निमज्जने तुदादिः",
    rom: "kruḍ (kruḍaṁ) nimajjane tudādiḥ"
  },
  'kruX1_kruXaz_xivAxiH_kope': {
    dev: "क्रुध् (क्रुधँ) कोपे दिवादिः",
    rom: "krudh (krudhaṁ) kope divādiḥ"
  },
  'krunc1_kruncaz_BvAxiH_alpIBAve': {
    dev: "क्रुन्च् (क्रुन्चँ) अल्पीभावे भ्वादिः",
    rom: "krunc (kruncaṁ) alpībhāve bhvādiḥ"
  },
  'krunc1_kruncaz_BvAxiH_kOtilye': {
    dev: "क्रुन्च् (क्रुन्चँ) कौटिल्ये भ्वादिः",
    rom: "krunc (kruncaṁ) kauṭilye bhvādiḥ"
  },
  'krunc1_kruncaz_BvAxiH_gawO': {
    dev: "क्रुन्च् (क्रुन्चँ) गतौ भ्वादिः",
    rom: "krunc (kruncaṁ) gatau bhvādiḥ"
  },
  'kruS1_kruSaz_BvAxiH_AhvAne': {
    dev: "क्रुश् (क्रुशँ) आह्वाने भ्वादिः",
    rom: "kruś (kruśaṁ) āhvāne bhvādiḥ"
  },
  'kruS1_kruSaz_BvAxiH_roxane': {
    dev: "क्रुश् (क्रुशँ) रोदने भ्वादिः",
    rom: "kruś (kruśaṁ) rodane bhvādiḥ"
  },
  'klaW1_klaWaz_BvAxiH_hiMsAyAm': {
    dev: "क्लथ् (क्लथँ) हिंसायाम् भ्वादिः",
    rom: "klath (klathaṁ) hiṃsāyām bhvādiḥ"
  },
  'klax1_klaxaz_BvAxiH_vEklavye': {
    dev: "क्लद् (क्लदँ) वैक्लव्ये भ्वादिः",
    rom: "klad (kladaṁ) vaiklavye bhvādiḥ"
  },
  'klax2_klaxiz_BvAxiH_AhvAne': {
    dev: "क्लद् (क्लदिँ) आह्वाने भ्वादिः",
    rom: "klad (kladiṁ) āhvāne bhvādiḥ"
  },
  'klax2_klaxiz_BvAxiH_roxane': {
    dev: "क्लद् (क्लदिँ) रोदने भ्वादिः",
    rom: "klad (kladiṁ) rodane bhvādiḥ"
  },
  'klax2_klaxiz_BvAxiH_vEklavye': {
    dev: "क्लद् (क्लदिँ) वैक्लव्ये भ्वादिः",
    rom: "klad (kladiṁ) vaiklavye bhvādiḥ"
  },
  'klam1_klamuz_xivAxiH_glAnO': {
    dev: "क्लम् (क्लमुँ) ग्लानौ दिवादिः",
    rom: "klam (klamuṁ) glānau divādiḥ"
  },
  'klix1_klixiz_BvAxiH_parixevane': {
    dev: "क्लिद् (क्लिदिँ) परिदेवने भ्वादिः",
    rom: "klid (klidiṁ) paridevane bhvādiḥ"
  },
  'klix2_klixUz_xivAxiH_ArxrIBAve': {
    dev: "क्लिद् (क्लिदूँ) आर्द्रीभावे दिवादिः",
    rom: "klid (klidūṁ) ārdrībhāve divādiḥ"
  },
  'kliS1_kliSaz_xivAxiH_upawApe': {
    dev: "क्लिश् (क्लिशँ) उपतापे दिवादिः",
    rom: "kliś (kliśaṁ) upatāpe divādiḥ"
  },
  'kliS2_kliSUz_kryAxiH_vibAXAyAm': {
    dev: "क्लिश् (क्लिशूँ) विबाधायाम् क्र्यादिः",
    rom: "kliś (kliśūṁ) vibādhāyām kryādiḥ"
  },
  'klIb1_klIbqz_BvAxiH_aXArRtye': {
    dev: "क्लीब् (क्लीबृँ) अधार्ष्ट्ये भ्वादिः",
    rom: "klīb (klībṛṁ) adhārṣṭye bhvādiḥ"
  },
  'kleS1_kleSaz_BvAxiH_avyakwAyAM_vAci': {
    dev: "क्लेश् (क्लेशँ) अव्यक्तायां_वाचि भ्वादिः",
    rom: "kleś (kleśaṁ) avyaktāyāṃ_vāci bhvādiḥ"
  },
  'kleS1_kleSaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "क्लेश् (क्लेशँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "kleś (kleśaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'kvaN1_kvaNaz_BvAxiH_Sabxe': {
    dev: "क्वण् (क्वणँ) शब्दे भ्वादिः",
    rom: "kvaṇ (kvaṇaṁ) śabde bhvādiḥ"
  },
  'kvaW1_kvaWez_BvAxiH_gawO': {
    dev: "क्वथ् (क्वथेँ) गतौ भ्वादिः",
    rom: "kvath (kvatheṁ) gatau bhvādiḥ"
  },
  'kvaW1_kvaWez_BvAxiH_niRpAke': {
    dev: "क्वथ् (क्वथेँ) निष्पाके भ्वादिः",
    rom: "kvath (kvatheṁ) niṣpāke bhvādiḥ"
  },
  'kRaj2_kRajiz_curAxiH_kqcCrajIvane': {
    dev: "क्षज् (क्षजिँ) कृच्छ्रजीवने चुरादिः",
    rom: "kṣaj (kṣajiṁ) kṛcchrajīvane curādiḥ"
  },
  'kRaj1_kRajiz_BvAxiH_gawO': {
    dev: "क्षज् (क्षजिँ) गतौ भ्वादिः",
    rom: "kṣaj (kṣajiṁ) gatau bhvādiḥ"
  },
  'kRaj1_kRajiz_BvAxiH_xAne': {
    dev: "क्षज् (क्षजिँ) दाने भ्वादिः",
    rom: "kṣaj (kṣajiṁ) dāne bhvādiḥ"
  },
  'kRaN1_kRaNuz_wanAxiH_hiMsAyAm': {
    dev: "क्षण् (क्षणुँ) हिंसायाम् तनादिः",
    rom: "kṣaṇ (kṣaṇuṁ) hiṃsāyām tanādiḥ"
  },
  'kRapa1_kRapa_curAxiH_preraNe': {
    dev: "क्षप (क्षप) प्रेरणे चुरादिः",
    rom: "kṣapa (kṣapa) preraṇe curādiḥ"
  },
  'kRap1_kRapiz_curAxiH_kRAnwyAm': {
    dev: "क्षप् (क्षपिँ) क्षान्त्याम् चुरादिः",
    rom: "kṣap (kṣapiṁ) kṣāntyām curādiḥ"
  },
  'kRam2_kRamUz_xivAxiH_sahane': {
    dev: "क्षम् (क्षमूँ) सहने दिवादिः",
    rom: "kṣam (kṣamūṁ) sahane divādiḥ"
  },
  'kRam1_kRamUzR_BvAxiH_sahane': {
    dev: "क्षम् (क्षमूँष्) सहने भ्वादिः",
    rom: "kṣam (kṣamūṁṣ) sahane bhvādiḥ"
  },
  'kRar1_kRaraz_BvAxiH_saFcalane': {
    dev: "क्षर् (क्षरँ) सञ्चलने भ्वादिः",
    rom: "kṣar (kṣaraṁ) sañcalane bhvādiḥ"
  },
  'kRal2_kRalaz_curAxiH_SOcakarmaNi': {
    dev: "क्षल् (क्षलँ) शौचकर्मणि चुरादिः",
    rom: "kṣal (kṣalaṁ) śaucakarmaṇi curādiḥ"
  },
  'kRal1_kRalaz_BvAxiH_saFcaye': {
    dev: "क्षल् (क्षलँ) सञ्चये भ्वादिः",
    rom: "kṣal (kṣalaṁ) sañcaye bhvādiḥ"
  },
  'kRal1_kRalaz_BvAxiH_saFcalane': {
    dev: "क्षल् (क्षलँ) सञ्चलने भ्वादिः",
    rom: "kṣal (kṣalaṁ) sañcalane bhvādiḥ"
  },
  'kRi1_kRi_BvAxiH_kRaye': {
    dev: "क्षि (क्षि) क्षये भ्वादिः",
    rom: "kṣi (kṣi) kṣaye bhvādiḥ"
  },
  'kRi3_kRi_wuxAxiH_gawO': {
    dev: "क्षि (क्षि) गतौ तुदादिः",
    rom: "kṣi (kṣi) gatau tudādiḥ"
  },
  'kRi3_kRi_wuxAxiH_nivAse': {
    dev: "क्षि (क्षि) निवासे तुदादिः",
    rom: "kṣi (kṣi) nivāse tudādiḥ"
  },
  'kRi2_kRi_svAxiH_hiMsAyAm': {
    dev: "क्षि (क्षि) हिंसायाम् स्वादिः",
    rom: "kṣi (kṣi) hiṃsāyām svādiḥ"
  },
  'kRi4_kRiR_kryAxiH_hiMsAyAm': {
    dev: "क्षि (क्षिष्) हिंसायाम् क्र्यादिः",
    rom: "kṣi (kṣiṣ) hiṃsāyām kryādiḥ"
  },
  'kRiN1_kRiNuz_wanAxiH_hiMsAyAm': {
    dev: "क्षिण् (क्षिणुँ) हिंसायाम् तनादिः",
    rom: "kṣiṇ (kṣiṇuṁ) hiṃsāyām tanādiḥ"
  },
  'kRip2_kRipaz_wuxAxiH_preraNe': {
    dev: "क्षिप् (क्षिपँ) प्रेरणे तुदादिः",
    rom: "kṣip (kṣipaṁ) preraṇe tudādiḥ"
  },
  'kRip1_kRipaz_xivAxiH_preraNe': {
    dev: "क्षिप् (क्षिपँ) प्रेरणे दिवादिः",
    rom: "kṣip (kṣipaṁ) preraṇe divādiḥ"
  },
  'kRiv1_kRivuz_BvAxiH_nirasane': {
    dev: "क्षिव् (क्षिवुँ) निरसने भ्वादिः",
    rom: "kṣiv (kṣivuṁ) nirasane bhvādiḥ"
  },
  'kRI1_kRIR_kryAxiH_hiMsAyAm': {
    dev: "क्षी (क्षीष्) हिंसायाम् क्र्यादिः",
    rom: "kṣī (kṣīṣ) hiṃsāyām kryādiḥ"
  },
  'kRIj1_kRIjaz_BvAxiH_avyakwe_Sabxe': {
    dev: "क्षीज् (क्षीजँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "kṣīj (kṣījaṁ) avyakte_śabde bhvādiḥ"
  },
  'kRIb1_kRIbqz_BvAxiH_maxe': {
    dev: "क्षीब् (क्षीबृँ) मदे भ्वादिः",
    rom: "kṣīb (kṣībṛṁ) made bhvādiḥ"
  },
  'kRIv2_kRIvaz_BvAxiH_nirasane': {
    dev: "क्षीव् (क्षीवँ) निरसने भ्वादिः",
    rom: "kṣīv (kṣīvaṁ) nirasane bhvādiḥ"
  },
  'kRIv1_kRIvuz_BvAxiH_nirasane': {
    dev: "क्षीव् (क्षीवुँ) निरसने भ्वादिः",
    rom: "kṣīv (kṣīvuṁ) nirasane bhvādiḥ"
  },
  'kRu1_tukRu_axAxiH_Sabxe': {
    dev: "क्षु (टुक्षु) शब्दे अदादिः",
    rom: "kṣu (ṭukṣu) śabde adādiḥ"
  },
  'kRux1_kRuxizr_ruXAxiH_sampeRaNe': {
    dev: "क्षुद् (क्षुदिँर्) सम्पेषणे रुधादिः",
    rom: "kṣud (kṣudiṁr) sampeṣaṇe rudhādiḥ"
  },
  'kRuX1_kRuXaz_xivAxiH_buBukRAyAm': {
    dev: "क्षुध् (क्षुधँ) बुभुक्षायाम् दिवादिः",
    rom: "kṣudh (kṣudhaṁ) bubhukṣāyām divādiḥ"
  },
  'kRuB3_kRuBaz_kryAxiH_saFcalane': {
    dev: "क्षुभ् (क्षुभँ) सञ्चलने क्र्यादिः",
    rom: "kṣubh (kṣubhaṁ) sañcalane kryādiḥ"
  },
  'kRuB2_kRuBaz_xivAxiH_saFcalane': {
    dev: "क्षुभ् (क्षुभँ) सञ्चलने दिवादिः",
    rom: "kṣubh (kṣubhaṁ) sañcalane divādiḥ"
  },
  'kRuB1_kRuBaz_BvAxiH_saFcalane': {
    dev: "क्षुभ् (क्षुभँ) सञ्चलने भ्वादिः",
    rom: "kṣubh (kṣubhaṁ) sañcalane bhvādiḥ"
  },
  'kRur1_kRuraz_wuxAxiH_vileKane': {
    dev: "क्षुर् (क्षुरँ) विलेखने तुदादिः",
    rom: "kṣur (kṣuraṁ) vilekhane tudādiḥ"
  },
  'kRE1_kRE_BvAxiH_kRaye': {
    dev: "क्षै (क्षै) क्षये भ्वादिः",
    rom: "kṣai (kṣai) kṣaye bhvādiḥ"
  },
  'kRota1_kRota_curAxiH_kRepe': {
    dev: "क्षोट (क्षोट) क्षेपे चुरादिः",
    rom: "kṣoṭa (kṣoṭa) kṣepe curādiḥ"
  },
  'kRNu1_kRNu_axAxiH_wejane': {
    dev: "क्ष्णु (क्ष्णु) तेजने अदादिः",
    rom: "kṣṇu (kṣṇu) tejane adādiḥ"
  },
  'kRmAy1_kRmAyIz_BvAxiH_viXUnane': {
    dev: "क्ष्माय् (क्ष्मायीँ) विधूनने भ्वादिः",
    rom: "kṣmāy (kṣmāyīṁ) vidhūnane bhvādiḥ"
  },
  'kRmIl1_kRmIlaz_BvAxiH_nimeRaNe': {
    dev: "क्ष्मील् (क्ष्मीलँ) निमेषणे भ्वादिः",
    rom: "kṣmīl (kṣmīlaṁ) nimeṣaṇe bhvādiḥ"
  },
  'kRvix1_FikRvixAz_BvAxiH_avyakwe_Sabxe': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "kṣvid (ñikṣvidāṁ) avyakte_śabde bhvādiḥ"
  },
  'kRvix2_FikRvixAz_xivAxiH_mocane': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) मोचने दिवादिः",
    rom: "kṣvid (ñikṣvidāṁ) mocane divādiḥ"
  },
  'kRvix2_FikRvixAz_xivAxiH_mohane': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) मोहने दिवादिः",
    rom: "kṣvid (ñikṣvidāṁ) mohane divādiḥ"
  },
  'kRvix1_FikRvixAz_BvAxiH_mohane': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) मोहने भ्वादिः",
    rom: "kṣvid (ñikṣvidāṁ) mohane bhvādiḥ"
  },
  'kRvix2_FikRvixAz_xivAxiH_snehane': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) स्नेहने दिवादिः",
    rom: "kṣvid (ñikṣvidāṁ) snehane divādiḥ"
  },
  'kRvix1_FikRvixAz_BvAxiH_snehane': {
    dev: "क्ष्विद् (ञिक्ष्विदाँ) स्नेहने भ्वादिः",
    rom: "kṣvid (ñikṣvidāṁ) snehane bhvādiḥ"
  },
  'kRvel1_kRvelqz_BvAxiH_calane': {
    dev: "क्ष्वेल् (क्ष्वेलृँ) चलने भ्वादिः",
    rom: "kṣvel (kṣvelṛṁ) calane bhvādiḥ"
  },
  'kLp1_kLpaz_curAxiH_avakalkane': {
    dev: "कॢप् (कॢपँ) अवकल्कने चुरादिः",
    rom: "kḷp (kḷpaṁ) avakalkane curādiḥ"
  },
  'Kac1_Kacaz_kryAxiH_BUwaprAxurBAve': {
    dev: "खच् (खचँ) भूतप्रादुर्भावे क्र्यादिः",
    rom: "khac (khacaṁ) bhūtaprādurbhāve kryādiḥ"
  },
  'Kaj1_Kajaz_BvAxiH_pAlane': {
    dev: "खज् (खजँ) पालने भ्वादिः",
    rom: "khaj (khajaṁ) pālane bhvādiḥ"
  },
  'Kaj1_Kajaz_BvAxiH_manWe': {
    dev: "खज् (खजँ) मन्थे भ्वादिः",
    rom: "khaj (khajaṁ) manthe bhvādiḥ"
  },
  'Kaj2_Kajiz_BvAxiH_gawivEkalye': {
    dev: "खज् (खजिँ) गतिवैकल्ये भ्वादिः",
    rom: "khaj (khajiṁ) gativaikalye bhvādiḥ"
  },
  'Kat1_Kataz_BvAxiH_kAfkRAyAm': {
    dev: "खट् (खटँ) काङ्क्षायाम् भ्वादिः",
    rom: "khaṭ (khaṭaṁ) kāṅkṣāyām bhvādiḥ"
  },
  'Kad2_Kadaz_curAxiH_Bexane': {
    dev: "खड् (खडँ) भेदने चुरादिः",
    rom: "khaḍ (khaḍaṁ) bhedane curādiḥ"
  },
  'Kad3_Kadiz_curAxiH_Bexane': {
    dev: "खड् (खडिँ) भेदने चुरादिः",
    rom: "khaḍ (khaḍiṁ) bhedane curādiḥ"
  },
  'Kad1_Kadiz_BvAxiH_manWe': {
    dev: "खड् (खडिँ) मन्थे भ्वादिः",
    rom: "khaḍ (khaḍiṁ) manthe bhvādiḥ"
  },
  'Kawt1_Kawtaz_curAxiH_saMvaraNe': {
    dev: "खत्ट् (खत्टँ) संवरणे चुरादिः",
    rom: "khatṭ (khatṭaṁ) saṃvaraṇe curādiḥ"
  },
  'Kax1_Kaxaz_BvAxiH_sWErye': {
    dev: "खद् (खदँ) स्थैर्ये भ्वादिः",
    rom: "khad (khadaṁ) sthairye bhvādiḥ"
  },
  'Kax1_Kaxaz_BvAxiH_hiMsAyAm': {
    dev: "खद् (खदँ) हिंसायाम् भ्वादिः",
    rom: "khad (khadaṁ) hiṃsāyām bhvādiḥ"
  },
  'Kan1_Kanuz_BvAxiH_avaxAraNe': {
    dev: "खन् (खनुँ) अवदारणे भ्वादिः",
    rom: "khan (khanuṁ) avadāraṇe bhvādiḥ"
  },
  'KarKa1_KarKa_BvAxiH_hasane': {
    dev: "खर्ख (खर्ख) हसने भ्वादिः",
    rom: "kharkha (kharkha) hasane bhvādiḥ"
  },
  'Karj1_Karjaz_BvAxiH_pUjane': {
    dev: "खर्ज् (खर्जँ) पूजने भ्वादिः",
    rom: "kharj (kharjaṁ) pūjane bhvādiḥ"
  },
  'Karj1_Karjaz_BvAxiH_mArjane': {
    dev: "खर्ज् (खर्जँ) मार्जने भ्वादिः",
    rom: "kharj (kharjaṁ) mārjane bhvādiḥ"
  },
  'Karj1_Karjaz_BvAxiH_vyaWane': {
    dev: "खर्ज् (खर्जँ) व्यथने भ्वादिः",
    rom: "kharj (kharjaṁ) vyathane bhvādiḥ"
  },
  'Karx1_Karxaz_BvAxiH_xanxaSUke': {
    dev: "खर्द् (खर्दँ) दन्दशूके भ्वादिः",
    rom: "khard (khardaṁ) dandaśūke bhvādiḥ"
  },
  'Karb1_Karbaz_BvAxiH_gawO': {
    dev: "खर्ब् (खर्बँ) गतौ भ्वादिः",
    rom: "kharb (kharbaṁ) gatau bhvādiḥ"
  },
  'Karv1_Karvaz_BvAxiH_xarpe': {
    dev: "खर्व् (खर्वँ) दर्पे भ्वादिः",
    rom: "kharv (kharvaṁ) darpe bhvādiḥ"
  },
  'Kal1_Kalaz_BvAxiH_calane': {
    dev: "खल् (खलँ) चलने भ्वादिः",
    rom: "khal (khalaṁ) calane bhvādiḥ"
  },
  'Kal1_Kalaz_BvAxiH_saFcaye': {
    dev: "खल् (खलँ) सञ्चये भ्वादिः",
    rom: "khal (khalaṁ) sañcaye bhvādiḥ"
  },
  'Kal1_Kalaz_BvAxiH_saFcalane': {
    dev: "खल् (खलँ) सञ्चलने भ्वादिः",
    rom: "khal (khalaṁ) sañcalane bhvādiḥ"
  },
  'Kav1_Kavaz_kryAxiH_BUwaprAxurBAve': {
    dev: "खव् (खवँ) भूतप्रादुर्भावे क्र्यादिः",
    rom: "khav (khavaṁ) bhūtaprādurbhāve kryādiḥ"
  },
  'KaR1_KaRaz_BvAxiH_hiMsAyAm': {
    dev: "खष् (खषँ) हिंसायाम् भ्वादिः",
    rom: "khaṣ (khaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'KAx1_KAxqz_BvAxiH_BakRaNe': {
    dev: "खाद् (खादृँ) भक्षणे भ्वादिः",
    rom: "khād (khādṛṁ) bhakṣaṇe bhvādiḥ"
  },
  'Kit1_Kitaz_BvAxiH_uwwrAse': {
    dev: "खिट् (खिटँ) उत्त्रासे भ्वादिः",
    rom: "khiṭ (khiṭaṁ) uttrāse bhvādiḥ"
  },
  'Kix1_Kixaz_xivAxiH_xEnye': {
    dev: "खिद् (खिदँ) दैन्ये दिवादिः",
    rom: "khid (khidaṁ) dainye divādiḥ"
  },
  'Kix3_Kixaz_ruXAxiH_xEnye': {
    dev: "खिद् (खिदँ) दैन्ये रुधादिः",
    rom: "khid (khidaṁ) dainye rudhādiḥ"
  },
  'Kix2_Kixaz_wuxAxiH_pariGAwe': {
    dev: "खिद् (खिदँ) परिघाते तुदादिः",
    rom: "khid (khidaṁ) parighāte tudādiḥ"
  },
  'Kix2_Kixaz_wuxAxiH_pariwApe': {
    dev: "खिद् (खिदँ) परितापे तुदादिः",
    rom: "khid (khidaṁ) paritāpe tudādiḥ"
  },
  'Kuj1_Kujuz_BvAxiH_sweyakaraNe': {
    dev: "खुज् (खुजुँ) स्तेयकरणे भ्वादिः",
    rom: "khuj (khujuṁ) steyakaraṇe bhvādiḥ"
  },
  'Kud2_Kudiz_curAxiH_KaNdane': {
    dev: "खुड् (खुडिँ) खण्डने चुरादिः",
    rom: "khuḍ (khuḍiṁ) khaṇḍane curādiḥ"
  },
  'Kud1_Kudiz_BvAxiH_gawivEkalye': {
    dev: "खुड् (खुडिँ) गतिवैकल्ये भ्वादिः",
    rom: "khuḍ (khuḍiṁ) gativaikalye bhvādiḥ"
  },
  'Kur1_Kuraz_wuxAxiH_KaNdane': {
    dev: "खुर् (खुरँ) खण्डने तुदादिः",
    rom: "khur (khuraṁ) khaṇḍane tudādiḥ"
  },
  'Kur1_Kuraz_wuxAxiH_Cexane': {
    dev: "खुर् (खुरँ) छेदने तुदादिः",
    rom: "khur (khuraṁ) chedane tudādiḥ"
  },
  'Kur1_Kuraz_wuxAxiH_vileKane': {
    dev: "खुर् (खुरँ) विलेखने तुदादिः",
    rom: "khur (khuraṁ) vilekhane tudādiḥ"
  },
  'Kurx1_Kurxaz_BvAxiH_krIdAyAm': {
    dev: "खुर्द् (खुर्दँ) क्रीडायाम् भ्वादिः",
    rom: "khurd (khurdaṁ) krīḍāyām bhvādiḥ"
  },
  'Keta1_Keta_curAxiH_BakRaNe': {
    dev: "खेट (खेट) भक्षणे चुरादिः",
    rom: "kheṭa (kheṭa) bhakṣaṇe curādiḥ"
  },
  'Kel1_Kelqz_BvAxiH_calane': {
    dev: "खेल् (खेलृँ) चलने भ्वादिः",
    rom: "khel (khelṛṁ) calane bhvādiḥ"
  },
  'Kev1_Kevqz_BvAxiH_sevane': {
    dev: "खेव् (खेवृँ) सेवने भ्वादिः",
    rom: "khev (khevṛṁ) sevane bhvādiḥ"
  },
  'KE1_KE_BvAxiH_Kaxane': {
    dev: "खै (खै) खदने भ्वादिः",
    rom: "khai (khai) khadane bhvādiḥ"
  },
  'Kota1_Kota_curAxiH_BakRaNe': {
    dev: "खोट (खोट) भक्षणे चुरादिः",
    rom: "khoṭa (khoṭa) bhakṣaṇe curādiḥ"
  },
  'Koda1_Koda_curAxiH_kRepe': {
    dev: "खोड (खोड) क्षेपे चुरादिः",
    rom: "khoḍa (khoḍa) kṣepe curādiḥ"
  },
  'Kor1_Korqz_BvAxiH_gawiprawiGAwe': {
    dev: "खोर् (खोरृँ) गतिप्रतिघाते भ्वादिः",
    rom: "khor (khorṛṁ) gatipratighāte bhvādiḥ"
  },
  'Kol1_Kolqz_BvAxiH_gawiprawiGAwe': {
    dev: "खोल् (खोलृँ) गतिप्रतिघाते भ्वादिः",
    rom: "khol (kholṛṁ) gatipratighāte bhvādiḥ"
  },
  'KyA1_KyA_axAxiH_prakaWane': {
    dev: "ख्या (ख्या) प्रकथने अदादिः",
    rom: "khyā (khyā) prakathane adādiḥ"
  },
  'gaj1_gajaz_BvAxiH_maxe': {
    dev: "गज् (गजँ) मदे भ्वादिः",
    rom: "gaj (gajaṁ) made bhvādiḥ"
  },
  'gaj3_gajaz_curAxiH_Sabxe': {
    dev: "गज् (गजँ) शब्दे चुरादिः",
    rom: "gaj (gajaṁ) śabde curādiḥ"
  },
  'gaj1_gajaz_BvAxiH_Sabxe': {
    dev: "गज् (गजँ) शब्दे भ्वादिः",
    rom: "gaj (gajaṁ) śabde bhvādiḥ"
  },
  'gaj2_gajiz_BvAxiH_Sabxe': {
    dev: "गज् (गजिँ) शब्दे भ्वादिः",
    rom: "gaj (gajiṁ) śabde bhvādiḥ"
  },
  'gad1_gadaz_BvAxiH_secane': {
    dev: "गड् (गडँ) सेचने भ्वादिः",
    rom: "gaḍ (gaḍaṁ) secane bhvādiḥ"
  },
  'gad2_gadiz_BvAxiH_vaxanEkaxeSe': {
    dev: "गड् (गडिँ) वदनैकदेशे भ्वादिः",
    rom: "gaḍ (gaḍiṁ) vadanaikadeśe bhvādiḥ"
  },
  'gaNa1_gaNa_curAxiH_safKyAne': {
    dev: "गण (गण) सङ्ख्याने चुरादिः",
    rom: "gaṇa (gaṇa) saṅkhyāne curādiḥ"
  },
  'gaxI1_gaxI_curAxiH_xevaSabxe': {
    dev: "गदी (गदी) देवशब्दे चुरादिः",
    rom: "gadī (gadī) devaśabde curādiḥ"
  },
  'gax1_gaxaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "गद् (गदँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "gad (gadaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'ganX1_ganXaz_curAxiH_arxane': {
    dev: "गन्ध् (गन्धँ) अर्दने चुरादिः",
    rom: "gandh (gandhaṁ) ardane curādiḥ"
  },
  'gam1_gamLz_BvAxiH_gawO': {
    dev: "गम् (गमॢँ) गतौ भ्वादिः",
    rom: "gam (gamḷṁ) gatau bhvādiḥ"
  },
  'garj1_garjaz_BvAxiH_Sabxe': {
    dev: "गर्ज् (गर्जँ) शब्दे भ्वादिः",
    rom: "garj (garjaṁ) śabde bhvādiḥ"
  },
  'garx2_garxaz_curAxiH_Sabxe': {
    dev: "गर्द् (गर्दँ) शब्दे चुरादिः",
    rom: "gard (gardaṁ) śabde curādiḥ"
  },
  'garx1_garxaz_BvAxiH_Sabxe': {
    dev: "गर्द् (गर्दँ) शब्दे भ्वादिः",
    rom: "gard (gardaṁ) śabde bhvādiḥ"
  },
  'garX1_garXaz_curAxiH_aBikAfkRAyAm': {
    dev: "गर्ध् (गर्धँ) अभिकाङ्क्षायाम् चुरादिः",
    rom: "gardh (gardhaṁ) abhikāṅkṣāyām curādiḥ"
  },
  'garb1_garbaz_BvAxiH_gawO': {
    dev: "गर्ब् (गर्बँ) गतौ भ्वादिः",
    rom: "garb (garbaṁ) gatau bhvādiḥ"
  },
  'garva1_garva_curAxiH_mAne': {
    dev: "गर्व (गर्व) माने चुरादिः",
    rom: "garva (garva) māne curādiḥ"
  },
  'garv1_garvaz_BvAxiH_xarpe': {
    dev: "गर्व् (गर्वँ) दर्पे भ्वादिः",
    rom: "garv (garvaṁ) darpe bhvādiḥ"
  },
  'garh1_garhaz_BvAxiH_kuwsAyAm': {
    dev: "गर्ह् (गर्हँ) कुत्सायाम् भ्वादिः",
    rom: "garh (garhaṁ) kutsāyām bhvādiḥ"
  },
  'garh2_garhaz_curAxiH_vininxane': {
    dev: "गर्ह् (गर्हँ) विनिन्दने चुरादिः",
    rom: "garh (garhaṁ) vinindane curādiḥ"
  },
  'gal1_galaz_BvAxiH_axane': {
    dev: "गल् (गलँ) अदने भ्वादिः",
    rom: "gal (galaṁ) adane bhvādiḥ"
  },
  'gal1_galaz_BvAxiH_garaNe': {
    dev: "गल् (गलँ) गरणे भ्वादिः",
    rom: "gal (galaṁ) garaṇe bhvādiḥ"
  },
  'gal2_galaz_curAxiH_SravaNe': {
    dev: "गल् (गलँ) श्रवणे चुरादिः",
    rom: "gal (galaṁ) śravaṇe curādiḥ"
  },
  'gal2_galaz_curAxiH_srAvaNe': {
    dev: "गल् (गलँ) स्रावणे चुरादिः",
    rom: "gal (galaṁ) srāvaṇe curādiḥ"
  },
  'galB1_galBaz_BvAxiH_XArRtye': {
    dev: "गल्भ् (गल्भँ) धार्ष्ट्ये भ्वादिः",
    rom: "galbh (galbhaṁ) dhārṣṭye bhvādiḥ"
  },
  'galh1_galhaz_BvAxiH_kuwsAyAm': {
    dev: "गल्ह् (गल्हँ) कुत्सायाम् भ्वादिः",
    rom: "galh (galhaṁ) kutsāyām bhvādiḥ"
  },
  'gaveRa1_gaveRa_curAxiH_mArgaNe': {
    dev: "गवेष (गवेष) मार्गणे चुरादिः",
    rom: "gaveṣa (gaveṣa) mārgaṇe curādiḥ"
  },
  'gA2_gA_juhowyAxiH_janane': {
    dev: "गा (गा) जनने जुहोत्यादिः",
    rom: "gā (gā) janane juhotyādiḥ"
  },
  'gA2_gA_juhowyAxiH_swuwO': {
    dev: "गा (गा) स्तुतौ जुहोत्यादिः",
    rom: "gā (gā) stutau juhotyādiḥ"
  },
  'gA1_gAf_BvAxiH_gawO': {
    dev: "गा (गाङ्) गतौ भ्वादिः",
    rom: "gā (gāṅ) gatau bhvādiḥ"
  },
  'gAX1_gAXqz_BvAxiH_granWe': {
    dev: "गाध् (गाधृँ) ग्रन्थे भ्वादिः",
    rom: "gādh (gādhṛṁ) granthe bhvādiḥ"
  },
  'gAX1_gAXqz_BvAxiH_prawiRTAyAm': {
    dev: "गाध् (गाधृँ) प्रतिष्ठायाम् भ्वादिः",
    rom: "gādh (gādhṛṁ) pratiṣṭhāyām bhvādiḥ"
  },
  'gAX1_gAXqz_BvAxiH_lipsAyAm': {
    dev: "गाध् (गाधृँ) लिप्सायाम् भ्वादिः",
    rom: "gādh (gādhṛṁ) lipsāyām bhvādiḥ"
  },
  'gAh1_gAhUz_BvAxiH_vilodane': {
    dev: "गाह् (गाहूँ) विलोडने भ्वादिः",
    rom: "gāh (gāhūṁ) viloḍane bhvādiḥ"
  },
  'gu2_gu_wuxAxiH_purIRowsarge': {
    dev: "गु (गु) पुरीषोत्सर्गे तुदादिः",
    rom: "gu (gu) purīṣotsarge tudādiḥ"
  },
  'gu1_guf_BvAxiH_avyakwe_Sabxe': {
    dev: "गु (गुङ्) अव्यक्ते_शब्दे भ्वादिः",
    rom: "gu (guṅ) avyakte_śabde bhvādiḥ"
  },
  'guj2_gujaz_wuxAxiH_Sabxe': {
    dev: "गुज् (गुजँ) शब्दे तुदादिः",
    rom: "guj (gujaṁ) śabde tudādiḥ"
  },
  'guj1_gujiz_BvAxiH_avyakwe_Sabxe': {
    dev: "गुज् (गुजिँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "guj (gujiṁ) avyakte_śabde bhvādiḥ"
  },
  'guT1_guTiz_curAxiH_veRtane': {
    dev: "गुठ् (गुठिँ) वेष्टने चुरादिः",
    rom: "guṭh (guṭhiṁ) veṣṭane curādiḥ"
  },
  'gud1_gudaz_wuxAxiH_prawiGAwe': {
    dev: "गुड् (गुडँ) प्रतिघाते तुदादिः",
    rom: "guḍ (guḍaṁ) pratighāte tudādiḥ"
  },
  'gud1_gudaz_wuxAxiH_rakRaNe': {
    dev: "गुड् (गुडँ) रक्षणे तुदादिः",
    rom: "guḍ (guḍaṁ) rakṣaṇe tudādiḥ"
  },
  'gud2_gudiz_curAxiH_rakRaNe': {
    dev: "गुड् (गुडिँ) रक्षणे चुरादिः",
    rom: "guḍ (guḍiṁ) rakṣaṇe curādiḥ"
  },
  'gud2_gudiz_curAxiH_veRtane': {
    dev: "गुड् (गुडिँ) वेष्टने चुरादिः",
    rom: "guḍ (guḍiṁ) veṣṭane curādiḥ"
  },
  'guNa1_guNa_curAxiH_AmanwraNe': {
    dev: "गुण (गुण) आमन्त्रणे चुरादिः",
    rom: "guṇa (guṇa) āmantraṇe curādiḥ"
  },
  'gux1_guxaz_BvAxiH_krIdAyAm': {
    dev: "गुद् (गुदँ) क्रीडायाम् भ्वादिः",
    rom: "gud (gudaṁ) krīḍāyām bhvādiḥ"
  },
  'guX2_guXaz_kryAxiH_roRe': {
    dev: "गुध् (गुधँ) रोषे क्र्यादिः",
    rom: "gudh (gudhaṁ) roṣe kryādiḥ"
  },
  'guX1_gqXuz_xivAxiH_pariveRtane': {
    dev: "गुध् (गृधुँ) परिवेष्टने दिवादिः",
    rom: "gudh (gṛdhuṁ) pariveṣṭane divādiḥ"
  },
  'gunP1_gunPaz_wuxAxiH_granWe': {
    dev: "गुन्फ् (गुन्फँ) ग्रन्थे तुदादिः",
    rom: "gunph (gunphaṁ) granthe tudādiḥ"
  },
  'gup2_gupaz_BvAxiH_kuwsAyAm': {
    dev: "गुप् (गुपँ) कुत्सायाम् भ्वादिः",
    rom: "gup (gupaṁ) kutsāyām bhvādiḥ"
  },
  'gup2_gupaz_BvAxiH_gopane': {
    dev: "गुप् (गुपँ) गोपने भ्वादिः",
    rom: "gup (gupaṁ) gopane bhvādiḥ"
  },
  'gup4_gupaz_curAxiH_BARArWe': {
    dev: "गुप् (गुपँ) भाषार्थे चुरादिः",
    rom: "gup (gupaṁ) bhāṣārthe curādiḥ"
  },
  'gup3_gupaz_xivAxiH_vyAkulawve': {
    dev: "गुप् (गुपँ) व्याकुलत्वे दिवादिः",
    rom: "gup (gupaṁ) vyākulatve divādiḥ"
  },
  'gup5_gupUz_curAxiH_BAsArWe': {
    dev: "गुप् (गुपूँ) भासार्थे चुरादिः",
    rom: "gup (gupūṁ) bhāsārthe curādiḥ"
  },
  'gup1_gupUz_BvAxiH_rakRaNe': {
    dev: "गुप् (गुपूँ) रक्षणे भ्वादिः",
    rom: "gup (gupūṁ) rakṣaṇe bhvādiḥ"
  },
  'guP1_guPaz_wuxAxiH_granWe': {
    dev: "गुफ् (गुफँ) ग्रन्थे तुदादिः",
    rom: "guph (guphaṁ) granthe tudādiḥ"
  },
  'gur1_gurIz_wuxAxiH_uxyamane': {
    dev: "गुर् (गुरीँ) उद्यमने तुदादिः",
    rom: "gur (gurīṁ) udyamane tudādiḥ"
  },
  'gurx1_gurxaz_BvAxiH_krIdAyAm': {
    dev: "गुर्द् (गुर्दँ) क्रीडायाम् भ्वादिः",
    rom: "gurd (gurdaṁ) krīḍāyām bhvādiḥ"
  },
  'gurx2_gurxaz_curAxiH_nikewane': {
    dev: "गुर्द् (गुर्दँ) निकेतने चुरादिः",
    rom: "gurd (gurdaṁ) niketane curādiḥ"
  },
  'gurx2_gurxaz_curAxiH_pUrvanikewane': {
    dev: "गुर्द् (गुर्दँ) पूर्वनिकेतने चुरादिः",
    rom: "gurd (gurdaṁ) pūrvaniketane curādiḥ"
  },
  'gurv1_gurvIz_BvAxiH_uxyamane': {
    dev: "गुर्व् (गुर्वीँ) उद्यमने भ्वादिः",
    rom: "gurv (gurvīṁ) udyamane bhvādiḥ"
  },
  'guh1_guhUz_BvAxiH_saMvaraNe': {
    dev: "गुह् (गुहूँ) संवरणे भ्वादिः",
    rom: "guh (guhūṁ) saṃvaraṇe bhvādiḥ"
  },
  'gU1_gU_wuxAxiH_purIRowsarge': {
    dev: "गू (गू) पुरीषोत्सर्गे तुदादिः",
    rom: "gū (gū) purīṣotsarge tudādiḥ"
  },
  'gUr2_gUraz_curAxiH_uxyamane': {
    dev: "गूर् (गूरँ) उद्यमने चुरादिः",
    rom: "gūr (gūraṁ) udyamane curādiḥ"
  },
  'gUr3_gUrIz_curAxiH_uxyamane': {
    dev: "गूर् (गूरीँ) उद्यमने चुरादिः",
    rom: "gūr (gūrīṁ) udyamane curādiḥ"
  },
  'gUr1_gUrIz_xivAxiH_gawO': {
    dev: "गूर् (गूरीँ) गतौ दिवादिः",
    rom: "gūr (gūrīṁ) gatau divādiḥ"
  },
  'gUr1_gUrIz_xivAxiH_hiMsAyAm': {
    dev: "गूर् (गूरीँ) हिंसायाम् दिवादिः",
    rom: "gūr (gūrīṁ) hiṃsāyām divādiḥ"
  },
  'gq3_gq_curAxiH_vijFAne': {
    dev: "गृ (गृ) विज्ञाने चुरादिः",
    rom: "gṛ (gṛ) vijñāne curādiḥ"
  },
  'gq1_gq_BvAxiH_secane': {
    dev: "गृ (गृ) सेचने भ्वादिः",
    rom: "gṛ (gṛ) secane bhvādiḥ"
  },
  'gqj1_gqjaz_BvAxiH_Sabxe': {
    dev: "गृज् (गृजँ) शब्दे भ्वादिः",
    rom: "gṛj (gṛjaṁ) śabde bhvādiḥ"
  },
  'gqj2_gqjiz_BvAxiH_Sabxe': {
    dev: "गृज् (गृजिँ) शब्दे भ्वादिः",
    rom: "gṛj (gṛjiṁ) śabde bhvādiḥ"
  },
  'gqX1_gqXuz_xivAxiH_aBikAfkRAyAm': {
    dev: "गृध् (गृधुँ) अभिकाङ्क्षायाम् दिवादिः",
    rom: "gṛdh (gṛdhuṁ) abhikāṅkṣāyām divādiḥ"
  },
  'gqha1_gqha_curAxiH_grahaNe': {
    dev: "गृह (गृह) ग्रहणे चुरादिः",
    rom: "gṛha (gṛha) grahaṇe curādiḥ"
  },
  'gqh1_gqhUz_BvAxiH_grahaNe': {
    dev: "गृह् (गृहूँ) ग्रहणे भ्वादिः",
    rom: "gṛh (gṛhūṁ) grahaṇe bhvādiḥ"
  },
  'gQ1_gQ_wuxAxiH_nigaraNe': {
    dev: "गॄ (गॄ) निगरणे तुदादिः",
    rom: "gṝ (gṝ) nigaraṇe tudādiḥ"
  },
  'gQ3_gQ_curAxiH_vijFAne': {
    dev: "गॄ (गॄ) विज्ञाने चुरादिः",
    rom: "gṝ (gṝ) vijñāne curādiḥ"
  },
  'gQ2_gQ_kryAxiH_Sabxe': {
    dev: "गॄ (गॄ) शब्दे क्र्यादिः",
    rom: "gṝ (gṝ) śabde kryādiḥ"
  },
  'gep1_gepqz_BvAxiH_kampane': {
    dev: "गेप् (गेपृँ) कम्पने भ्वादिः",
    rom: "gep (gepṛṁ) kampane bhvādiḥ"
  },
  'gep1_gepqz_BvAxiH_xEnye': {
    dev: "गेप् (गेपृँ) दैन्ये भ्वादिः",
    rom: "gep (gepṛṁ) dainye bhvādiḥ"
  },
  'gev1_gevqz_BvAxiH_secane': {
    dev: "गेव् (गेवृँ) सेचने भ्वादिः",
    rom: "gev (gevṛṁ) secane bhvādiḥ"
  },
  'geR1_geRqz_BvAxiH_anvicCAyAm': {
    dev: "गेष् (गेषृँ) अन्विच्छायाम् भ्वादिः",
    rom: "geṣ (geṣṛṁ) anvicchāyām bhvādiḥ"
  },
  'gE1_gE_BvAxiH_Sabxe': {
    dev: "गै (गै) शब्दे भ्वादिः",
    rom: "gai (gai) śabde bhvādiḥ"
  },
  'goma1_goma_curAxiH_upalepane': {
    dev: "गोम (गोम) उपलेपने चुरादिः",
    rom: "goma (goma) upalepane curādiḥ"
  },
  'goRt1_goRtaz_BvAxiH_safGAwe': {
    dev: "गोष्ट् (गोष्टँ) सङ्घाते भ्वादिः",
    rom: "goṣṭ (goṣṭaṁ) saṅghāte bhvādiḥ"
  },
  'graW1_graWiz_BvAxiH_kOtilye': {
    dev: "ग्रथ् (ग्रथिँ) कौटिल्ये भ्वादिः",
    rom: "grath (grathiṁ) kauṭilye bhvādiḥ"
  },
  'granW2_granWaz_curAxiH_banXane': {
    dev: "ग्रन्थ् (ग्रन्थँ) बन्धने चुरादिः",
    rom: "granth (granthaṁ) bandhane curādiḥ"
  },
  'granW1_granWaz_kryAxiH_sanxarBe': {
    dev: "ग्रन्थ् (ग्रन्थँ) सन्दर्भे क्र्यादिः",
    rom: "granth (granthaṁ) sandarbhe kryādiḥ"
  },
  'granW2_granWaz_curAxiH_sanxarBe': {
    dev: "ग्रन्थ् (ग्रन्थँ) सन्दर्भे चुरादिः",
    rom: "granth (granthaṁ) sandarbhe curādiḥ"
  },
  'gras2_grasaz_curAxiH_grahaNe': {
    dev: "ग्रस् (ग्रसँ) ग्रहणे चुरादिः",
    rom: "gras (grasaṁ) grahaṇe curādiḥ"
  },
  'gras1_grasuz_BvAxiH_axane': {
    dev: "ग्रस् (ग्रसुँ) अदने भ्वादिः",
    rom: "gras (grasuṁ) adane bhvādiḥ"
  },
  'grah1_grahaz_kryAxiH_upAxAne': {
    dev: "ग्रह् (ग्रहँ) उपादाने क्र्यादिः",
    rom: "grah (grahaṁ) upādāne kryādiḥ"
  },
  'grAma1_grAma_curAxiH_AmanwraNe': {
    dev: "ग्राम (ग्राम) आमन्त्रणे चुरादिः",
    rom: "grāma (grāma) āmantraṇe curādiḥ"
  },
  'gruc1_grucuz_BvAxiH_sweyakaraNe': {
    dev: "ग्रुच् (ग्रुचुँ) स्तेयकरणे भ्वादिः",
    rom: "gruc (grucuṁ) steyakaraṇe bhvādiḥ"
  },
  'glas1_glasuz_BvAxiH_axane': {
    dev: "ग्लस् (ग्लसुँ) अदने भ्वादिः",
    rom: "glas (glasuṁ) adane bhvādiḥ"
  },
  'gluc1_glucuz_BvAxiH_sweyakaraNe': {
    dev: "ग्लुच् (ग्लुचुँ) स्तेयकरणे भ्वादिः",
    rom: "gluc (glucuṁ) steyakaraṇe bhvādiḥ"
  },
  'glunc1_gluncuz_BvAxiH_gawO': {
    dev: "ग्लुन्च् (ग्लुन्चुँ) गतौ भ्वादिः",
    rom: "glunc (gluncuṁ) gatau bhvādiḥ"
  },
  'glUh1_glUhUz_BvAxiH_grahaNe': {
    dev: "ग्लूह् (ग्लूहूँ) ग्रहणे भ्वादिः",
    rom: "glūh (glūhūṁ) grahaṇe bhvādiḥ"
  },
  'glep1_glepqz_BvAxiH_kampane': {
    dev: "ग्लेप् (ग्लेपृँ) कम्पने भ्वादिः",
    rom: "glep (glepṛṁ) kampane bhvādiḥ"
  },
  'glep1_glepqz_BvAxiH_xEnye': {
    dev: "ग्लेप् (ग्लेपृँ) दैन्ये भ्वादिः",
    rom: "glep (glepṛṁ) dainye bhvādiḥ"
  },
  'glev1_glevqz_BvAxiH_secane': {
    dev: "ग्लेव् (ग्लेवृँ) सेचने भ्वादिः",
    rom: "glev (glevṛṁ) secane bhvādiḥ"
  },
  'glev1_glevqz_BvAxiH_sevane': {
    dev: "ग्लेव् (ग्लेवृँ) सेवने भ्वादिः",
    rom: "glev (glevṛṁ) sevane bhvādiḥ"
  },
  'gleR1_gleRqz_BvAxiH_anvicCAyAm': {
    dev: "ग्लेष् (ग्लेषृँ) अन्विच्छायाम् भ्वादिः",
    rom: "gleṣ (gleṣṛṁ) anvicchāyām bhvādiḥ"
  },
  'glE1_glE_BvAxiH_harRakRaye': {
    dev: "ग्लै (ग्लै) हर्षक्षये भ्वादिः",
    rom: "glai (glai) harṣakṣaye bhvādiḥ"
  },
  'GagG1_GagGaz_BvAxiH_hasane': {
    dev: "घग्घ् (घग्घँ) हसने भ्वादिः",
    rom: "ghaggh (ghagghaṁ) hasane bhvādiḥ"
  },
  'GaG1_GaGaz_BvAxiH_hasane': {
    dev: "घघ् (घघँ) हसने भ्वादिः",
    rom: "ghagh (ghaghaṁ) hasane bhvādiḥ"
  },
  'Gat1_Gataz_BvAxiH_ceRtAyAm': {
    dev: "घट् (घटँ) चेष्टायाम् भ्वादिः",
    rom: "ghaṭ (ghaṭaṁ) ceṣṭāyām bhvādiḥ"
  },
  'Gat2_Gataz_curAxiH_BARArWe': {
    dev: "घट् (घटँ) भाषार्थे चुरादिः",
    rom: "ghaṭ (ghaṭaṁ) bhāṣārthe curādiḥ"
  },
  'Gat2_Gataz_curAxiH_Bexane': {
    dev: "घट् (घटँ) भेदने चुरादिः",
    rom: "ghaṭ (ghaṭaṁ) bhedane curādiḥ"
  },
  'Gat2_Gataz_curAxiH_safGAwe': {
    dev: "घट् (घटँ) सङ्घाते चुरादिः",
    rom: "ghaṭ (ghaṭaṁ) saṅghāte curādiḥ"
  },
  'Gat3_Gatiz_curAxiH_BARArWe': {
    dev: "घट् (घटिँ) भाषार्थे चुरादिः",
    rom: "ghaṭ (ghaṭiṁ) bhāṣārthe curādiḥ"
  },
  'Gat3_Gatiz_curAxiH_BAsArWe': {
    dev: "घट् (घटिँ) भासार्थे चुरादिः",
    rom: "ghaṭ (ghaṭiṁ) bhāsārthe curādiḥ"
  },
  'Gawt2_Gawtaz_curAxiH_calane': {
    dev: "घत्ट् (घत्टँ) चलने चुरादिः",
    rom: "ghatṭ (ghatṭaṁ) calane curādiḥ"
  },
  'Gawt1_Gawtaz_BvAxiH_calane': {
    dev: "घत्ट् (घत्टँ) चलने भ्वादिः",
    rom: "ghatṭ (ghatṭaṁ) calane bhvādiḥ"
  },
  'Garb1_Garbaz_BvAxiH_gawO': {
    dev: "घर्ब् (घर्बँ) गतौ भ्वादिः",
    rom: "gharb (gharbaṁ) gatau bhvādiḥ"
  },
  'Gas2_Gasiz_BvAxiH_karaNe': {
    dev: "घस् (घसिँ) करणे भ्वादिः",
    rom: "ghas (ghasiṁ) karaṇe bhvādiḥ"
  },
  'Gas1_GasLz_BvAxiH_axane': {
    dev: "घस् (घसॢँ) अदने भ्वादिः",
    rom: "ghas (ghasḷṁ) adane bhvādiḥ"
  },
  'GiN1_GiNiz_BvAxiH_grahaNe': {
    dev: "घिण् (घिणिँ) ग्रहणे भ्वादिः",
    rom: "ghiṇ (ghiṇiṁ) grahaṇe bhvādiḥ"
  },
  'Gu1_Guf_BvAxiH_Sabxe': {
    dev: "घु (घुङ्) शब्दे भ्वादिः",
    rom: "ghu (ghuṅ) śabde bhvādiḥ"
  },
  'Gut1_Gutaz_BvAxiH_parivarwane': {
    dev: "घुट् (घुटँ) परिवर्तने भ्वादिः",
    rom: "ghuṭ (ghuṭaṁ) parivartane bhvādiḥ"
  },
  'Gut2_Gutaz_wuxAxiH_prawiGAwe': {
    dev: "घुट् (घुटँ) प्रतिघाते तुदादिः",
    rom: "ghuṭ (ghuṭaṁ) pratighāte tudādiḥ"
  },
  'GuN3_GuNaz_wuxAxiH_BramaNe': {
    dev: "घुण् (घुणँ) भ्रमणे तुदादिः",
    rom: "ghuṇ (ghuṇaṁ) bhramaṇe tudādiḥ"
  },
  'GuN2_GuNaz_BvAxiH_BramaNe': {
    dev: "घुण् (घुणँ) भ्रमणे भ्वादिः",
    rom: "ghuṇ (ghuṇaṁ) bhramaṇe bhvādiḥ"
  },
  'GuN1_GuNiz_BvAxiH_grahaNe': {
    dev: "घुण् (घुणिँ) ग्रहणे भ्वादिः",
    rom: "ghuṇ (ghuṇiṁ) grahaṇe bhvādiḥ"
  },
  'Gur1_Guraz_wuxAxiH_BImArWe': {
    dev: "घुर् (घुरँ) भीमार्थे तुदादिः",
    rom: "ghur (ghuraṁ) bhīmārthe tudādiḥ"
  },
  'Gur1_Guraz_wuxAxiH_Sabxe': {
    dev: "घुर् (घुरँ) शब्दे तुदादिः",
    rom: "ghur (ghuraṁ) śabde tudādiḥ"
  },
  'GuR1_GuRiz_BvAxiH_kAnwikaraNe': {
    dev: "घुष् (घुषिँ) कान्तिकरणे भ्वादिः",
    rom: "ghuṣ (ghuṣiṁ) kāntikaraṇe bhvādiḥ"
  },
  'GuR3_GuRizr_curAxiH_aviSabxane': {
    dev: "घुष् (घुषिँर्) अविशब्दने चुरादिः",
    rom: "ghuṣ (ghuṣiṁr) aviśabdane curādiḥ"
  },
  'GuR3_GuRizr_curAxiH_viSabxane': {
    dev: "घुष् (घुषिँर्) विशब्दने चुरादिः",
    rom: "ghuṣ (ghuṣiṁr) viśabdane curādiḥ"
  },
  'GuR2_GuRizr_BvAxiH_Sabxe': {
    dev: "घुष् (घुषिँर्) शब्दे भ्वादिः",
    rom: "ghuṣ (ghuṣiṁr) śabde bhvādiḥ"
  },
  'GUr1_GUrIz_xivAxiH_vayohAnO': {
    dev: "घूर् (घूरीँ) वयोहानौ दिवादिः",
    rom: "ghūr (ghūrīṁ) vayohānau divādiḥ"
  },
  'GUr1_GUrIz_xivAxiH_hiMsAyAm': {
    dev: "घूर् (घूरीँ) हिंसायाम् दिवादिः",
    rom: "ghūr (ghūrīṁ) hiṃsāyām divādiḥ"
  },
  'GUrN2_GUrNaz_wuxAxiH_BramaNe': {
    dev: "घूर्ण् (घूर्णँ) भ्रमणे तुदादिः",
    rom: "ghūrṇ (ghūrṇaṁ) bhramaṇe tudādiḥ"
  },
  'GUrN1_GUrNaz_BvAxiH_BramaNe': {
    dev: "घूर्ण् (घूर्णँ) भ्रमणे भ्वादिः",
    rom: "ghūrṇ (ghūrṇaṁ) bhramaṇe bhvādiḥ"
  },
  'Gq3_Gq_curAxiH_samprasravaNe': {
    dev: "घृ (घृ) सम्प्रस्रवणे चुरादिः",
    rom: "ghṛ (ghṛ) samprasravaṇe curādiḥ"
  },
  'Gq1_Gq_BvAxiH_secane': {
    dev: "घृ (घृ) सेचने भ्वादिः",
    rom: "ghṛ (ghṛ) secane bhvādiḥ"
  },
  'GqN1_GqNiz_BvAxiH_grahaNe': {
    dev: "घृण् (घृणिँ) ग्रहणे भ्वादिः",
    rom: "ghṛṇ (ghṛṇiṁ) grahaṇe bhvādiḥ"
  },
  'GqN2_GqNuz_wanAxiH_xIpwO': {
    dev: "घृण् (घृणुँ) दीप्तौ तनादिः",
    rom: "ghṛṇ (ghṛṇuṁ) dīptau tanādiḥ"
  },
  'GqR1_GqRuz_BvAxiH_safGarRe': {
    dev: "घृष् (घृषुँ) सङ्घर्षे भ्वादिः",
    rom: "ghṛṣ (ghṛṣuṁ) saṅgharṣe bhvādiḥ"
  },
  'GrA1_GrA_BvAxiH_ganXopAxAne': {
    dev: "घ्रा (घ्रा) गन्धोपादाने भ्वादिः",
    rom: "ghrā (ghrā) gandhopādāne bhvādiḥ"
  },
  'fu1_fuf_BvAxiH_Sabxe': {
    dev: "ङु (ङुङ्) शब्दे भ्वादिः",
    rom: "ṅu (ṅuṅ) śabde bhvādiḥ"
  },
  'cakAs1_cakAsqz_axAxiH_xIpwO': {
    dev: "चकास् (चकासृँ) दीप्तौ अदादिः",
    rom: "cakās (cakāsṛṁ) dīptau adādiḥ"
  },
  'cak1_cakaz_BvAxiH_wqpwO': {
    dev: "चक् (चकँ) तृप्तौ भ्वादिः",
    rom: "cak (cakaṁ) tṛptau bhvādiḥ"
  },
  'cak1_cakaz_BvAxiH_prawiGAwe': {
    dev: "चक् (चकँ) प्रतिघाते भ्वादिः",
    rom: "cak (cakaṁ) pratighāte bhvādiḥ"
  },
  'cakk1_cakkaz_curAxiH_vyaWane': {
    dev: "चक्क् (चक्कँ) व्यथने चुरादिः",
    rom: "cakk (cakkaṁ) vyathane curādiḥ"
  },
  'cakR1_cakRizf_axAxiH_vyakwAyAM_vAci': {
    dev: "चक्ष् (चक्षिँङ्) व्यक्तायां_वाचि अदादिः",
    rom: "cakṣ (cakṣiṁṅ) vyaktāyāṃ_vāci adādiḥ"
  },
  'cat1_cataz_curAxiH_Bexane': {
    dev: "चट् (चटँ) भेदने चुरादिः",
    rom: "caṭ (caṭaṁ) bhedane curādiḥ"
  },
  'cad2_cadiz_curAxiH_kope': {
    dev: "चड् (चडिँ) कोपे चुरादिः",
    rom: "caḍ (caḍiṁ) kope curādiḥ"
  },
  'cad1_cadiz_BvAxiH_kope': {
    dev: "चड् (चडिँ) कोपे भ्वादिः",
    rom: "caḍ (caḍiṁ) kope bhvādiḥ"
  },
  'caN1_caNaz_BvAxiH_gawO': {
    dev: "चण् (चणँ) गतौ भ्वादिः",
    rom: "caṇ (caṇaṁ) gatau bhvādiḥ"
  },
  'caN1_caNaz_BvAxiH_xAne': {
    dev: "चण् (चणँ) दाने भ्वादिः",
    rom: "caṇ (caṇaṁ) dāne bhvādiḥ"
  },
  'caw1_cawez_BvAxiH_pariBARaNe': {
    dev: "चत् (चतेँ) परिभाषणे भ्वादिः",
    rom: "cat (cateṁ) paribhāṣaṇe bhvādiḥ"
  },
  'caw1_cawez_BvAxiH_yAFcAyAm': {
    dev: "चत् (चतेँ) याञ्चायाम् भ्वादिः",
    rom: "cat (cateṁ) yāñcāyām bhvādiḥ"
  },
  'cax2_caxiz_BvAxiH_AhlAxane': {
    dev: "चद् (चदिँ) आह्लादने भ्वादिः",
    rom: "cad (cadiṁ) āhlādane bhvādiḥ"
  },
  'cax2_caxiz_BvAxiH_xIpwO': {
    dev: "चद् (चदिँ) दीप्तौ भ्वादिः",
    rom: "cad (cadiṁ) dīptau bhvādiḥ"
  },
  'cax2_caxiz_BvAxiH_hlAxane': {
    dev: "चद् (चदिँ) ह्लादने भ्वादिः",
    rom: "cad (cadiṁ) hlādane bhvādiḥ"
  },
  'cax1_caxez_BvAxiH_pariBARaNe': {
    dev: "चद् (चदेँ) परिभाषणे भ्वादिः",
    rom: "cad (cadeṁ) paribhāṣaṇe bhvādiḥ"
  },
  'cax1_caxez_BvAxiH_yAFcAyAm': {
    dev: "चद् (चदेँ) याञ्चायाम् भ्वादिः",
    rom: "cad (cadeṁ) yāñcāyām bhvādiḥ"
  },
  'can2_canaz_BvAxiH_hiMsAyAm': {
    dev: "चन् (चनँ) हिंसायाम् भ्वादिः",
    rom: "can (canaṁ) hiṃsāyām bhvādiḥ"
  },
  'can1_canuz_BvAxiH_hiMsAyAm': {
    dev: "चन् (चनुँ) हिंसायाम् भ्वादिः",
    rom: "can (canuṁ) hiṃsāyām bhvādiḥ"
  },
  'canc1_cancuz_BvAxiH_gawO': {
    dev: "चन्च् (चन्चुँ) गतौ भ्वादिः",
    rom: "canc (cancuṁ) gatau bhvādiḥ"
  },
  'cap2_capaz_curAxiH_kalkane': {
    dev: "चप् (चपँ) कल्कने चुरादिः",
    rom: "cap (capaṁ) kalkane curādiḥ"
  },
  'cap1_capaz_BvAxiH_sAnwvane': {
    dev: "चप् (चपँ) सान्त्वने भ्वादिः",
    rom: "cap (capaṁ) sāntvane bhvādiḥ"
  },
  'cap3_capiz_curAxiH_gawO': {
    dev: "चप् (चपिँ) गतौ चुरादिः",
    rom: "cap (capiṁ) gatau curādiḥ"
  },
  'cam1_camuz_BvAxiH_axane': {
    dev: "चम् (चमुँ) अदने भ्वादिः",
    rom: "cam (camuṁ) adane bhvādiḥ"
  },
  'cam2_camuz_svAxiH_BakRaNe': {
    dev: "चम् (चमुँ) भक्षणे स्वादिः",
    rom: "cam (camuṁ) bhakṣaṇe svādiḥ"
  },
  'cay1_cayaz_BvAxiH_gawO': {
    dev: "चय् (चयँ) गतौ भ्वादिः",
    rom: "cay (cayaṁ) gatau bhvādiḥ"
  },
  'car1_caraz_BvAxiH_gawO': {
    dev: "चर् (चरँ) गतौ भ्वादिः",
    rom: "car (caraṁ) gatau bhvādiḥ"
  },
  'car2_caraz_curAxiH_saMSaye': {
    dev: "चर् (चरँ) संशये चुरादिः",
    rom: "car (caraṁ) saṃśaye curādiḥ"
  },
  'carc3_carcaz_curAxiH_aXyayane': {
    dev: "चर्च् (चर्चँ) अध्ययने चुरादिः",
    rom: "carc (carcaṁ) adhyayane curādiḥ"
  },
  'carc1_carcaz_BvAxiH_warjane': {
    dev: "चर्च् (चर्चँ) तर्जने भ्वादिः",
    rom: "carc (carcaṁ) tarjane bhvādiḥ"
  },
  'carc2_carcaz_wuxAxiH_pariBARaNe': {
    dev: "चर्च् (चर्चँ) परिभाषणे तुदादिः",
    rom: "carc (carcaṁ) paribhāṣaṇe tudādiḥ"
  },
  'carc1_carcaz_BvAxiH_pariBARaNe': {
    dev: "चर्च् (चर्चँ) परिभाषणे भ्वादिः",
    rom: "carc (carcaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'carc2_carcaz_wuxAxiH_Barwsane': {
    dev: "चर्च् (चर्चँ) भर्त्सने तुदादिः",
    rom: "carc (carcaṁ) bhartsane tudādiḥ"
  },
  'carc2_carcaz_wuxAxiH_sanwarjane': {
    dev: "चर्च् (चर्चँ) सन्तर्जने तुदादिः",
    rom: "carc (carcaṁ) santarjane tudādiḥ"
  },
  'carc1_carcaz_BvAxiH_sanwarjane': {
    dev: "चर्च् (चर्चँ) सन्तर्जने भ्वादिः",
    rom: "carc (carcaṁ) santarjane bhvādiḥ"
  },
  'carc1_carcaz_BvAxiH_hiMsAyAm': {
    dev: "चर्च् (चर्चँ) हिंसायाम् भ्वादिः",
    rom: "carc (carcaṁ) hiṃsāyām bhvādiḥ"
  },
  'carC1_carCaz_wuxAxiH_pariBARaNe': {
    dev: "चर्छ् (चर्छँ) परिभाषणे तुदादिः",
    rom: "carch (carchaṁ) paribhāṣaṇe tudādiḥ"
  },
  'carb1_carbaz_BvAxiH_gawO': {
    dev: "चर्ब् (चर्बँ) गतौ भ्वादिः",
    rom: "carb (carbaṁ) gatau bhvādiḥ"
  },
  'carv1_carvaz_BvAxiH_axane': {
    dev: "चर्व् (चर्वँ) अदने भ्वादिः",
    rom: "carv (carvaṁ) adane bhvādiḥ"
  },
  'cal1_calaz_BvAxiH_kampane': {
    dev: "चल् (चलँ) कम्पने भ्वादिः",
    rom: "cal (calaṁ) kampane bhvādiḥ"
  },
  'cal1_calaz_BvAxiH_kalpane': {
    dev: "चल् (चलँ) कल्पने भ्वादिः",
    rom: "cal (calaṁ) kalpane bhvādiḥ"
  },
  'cal3_calaz_curAxiH_BqwO': {
    dev: "चल् (चलँ) भृतौ चुरादिः",
    rom: "cal (calaṁ) bhṛtau curādiḥ"
  },
  'cal2_calaz_wuxAxiH_vikasane': {
    dev: "चल् (चलँ) विकसने तुदादिः",
    rom: "cal (calaṁ) vikasane tudādiḥ"
  },
  'cal2_calaz_wuxAxiH_vilasane': {
    dev: "चल् (चलँ) विलसने तुदादिः",
    rom: "cal (calaṁ) vilasane tudādiḥ"
  },
  'caR1_caRaz_BvAxiH_BakRaNe': {
    dev: "चष् (चषँ) भक्षणे भ्वादिः",
    rom: "caṣ (caṣaṁ) bhakṣaṇe bhvādiḥ"
  },
  'caha1_caha_curAxiH_parikalkane': {
    dev: "चह (चह) परिकल्कने चुरादिः",
    rom: "caha (caha) parikalkane curādiḥ"
  },
  'cah2_cahaz_curAxiH_parikalkane': {
    dev: "चह् (चहँ) परिकल्कने चुरादिः",
    rom: "cah (cahaṁ) parikalkane curādiḥ"
  },
  'cah1_cahaz_BvAxiH_parikalkane': {
    dev: "चह् (चहँ) परिकल्कने भ्वादिः",
    rom: "cah (cahaṁ) parikalkane bhvādiḥ"
  },
  'cAy1_cAyqz_BvAxiH_niSAmane': {
    dev: "चाय् (चायृँ) निशामने भ्वादिः",
    rom: "cāy (cāyṛṁ) niśāmane bhvādiḥ"
  },
  'cAy1_cAyqz_BvAxiH_pUjAyAm': {
    dev: "चाय् (चायृँ) पूजायाम् भ्वादिः",
    rom: "cāy (cāyṛṁ) pūjāyām bhvādiḥ"
  },
  'ci2_ciF_curAxiH_cayane': {
    dev: "चि (चिञ्) चयने चुरादिः",
    rom: "ci (ciñ) cayane curādiḥ"
  },
  'ci1_ciF_svAxiH_cayane': {
    dev: "चि (चिञ्) चयने स्वादिः",
    rom: "ci (ciñ) cayane svādiḥ"
  },
  'cit1_citaz_BvAxiH_paraprERye': {
    dev: "चिट् (चिटँ) परप्रैष्ये भ्वादिः",
    rom: "ciṭ (ciṭaṁ) parapraiṣye bhvādiḥ"
  },
  'ciw3_ciwaz_curAxiH_saFcewane': {
    dev: "चित् (चितँ) सञ्चेतने चुरादिः",
    rom: "cit (citaṁ) sañcetane curādiḥ"
  },
  'ciw2_ciwiz_curAxiH_smqwyAm': {
    dev: "चित् (चितिँ) स्मृत्याम् चुरादिः",
    rom: "cit (citiṁ) smṛtyām curādiḥ"
  },
  'ciw1_ciwIz_BvAxiH_saMjFAne': {
    dev: "चित् (चितीँ) संज्ञाने भ्वादिः",
    rom: "cit (citīṁ) saṃjñāne bhvādiḥ"
  },
  'ciwra1_ciwra_curAxiH_ciwrIkaraNe': {
    dev: "चित्र (चित्र) चित्रीकरणे चुरादिः",
    rom: "citra (citra) citrīkaraṇe curādiḥ"
  },
  'ciri1_ciri_svAxiH_hiMsAyAm': {
    dev: "चिरि (चिरि) हिंसायाम् स्वादिः",
    rom: "ciri (ciri) hiṃsāyām svādiḥ"
  },
  'cil1_cilaz_wuxAxiH_vasane': {
    dev: "चिल् (चिलँ) वसने तुदादिः",
    rom: "cil (cilaṁ) vasane tudādiḥ"
  },
  'cill1_cillaz_BvAxiH_BAvakaraNe': {
    dev: "चिल्ल् (चिल्लँ) भावकरणे भ्वादिः",
    rom: "cill (cillaṁ) bhāvakaraṇe bhvādiḥ"
  },
  'cill1_cillaz_BvAxiH_SEWilye': {
    dev: "चिल्ल् (चिल्लँ) शैथिल्ये भ्वादिः",
    rom: "cill (cillaṁ) śaithilye bhvādiḥ"
  },
  'cIk1_cIkaz_curAxiH_marRaNe': {
    dev: "चीक् (चीकँ) मर्षणे चुरादिः",
    rom: "cīk (cīkaṁ) marṣaṇe curādiḥ"
  },
  'cIB1_cIBqz_BvAxiH_kawWane': {
    dev: "चीभ् (चीभृँ) कत्थने भ्वादिः",
    rom: "cībh (cībhṛṁ) katthane bhvādiḥ"
  },
  'cIv2_cIvaz_BvAxiH_AxAne': {
    dev: "चीव् (चीवँ) आदाने भ्वादिः",
    rom: "cīv (cīvaṁ) ādāne bhvādiḥ"
  },
  'cIv3_cIvaz_curAxiH_BARArWe': {
    dev: "चीव् (चीवँ) भाषार्थे चुरादिः",
    rom: "cīv (cīvaṁ) bhāṣārthe curādiḥ"
  },
  'cIv3_cIvaz_curAxiH_BAsArWe': {
    dev: "चीव् (चीवँ) भासार्थे चुरादिः",
    rom: "cīv (cīvaṁ) bhāsārthe curādiḥ"
  },
  'cIv2_cIvaz_BvAxiH_saMvaraNe': {
    dev: "चीव् (चीवँ) संवरणे भ्वादिः",
    rom: "cīv (cīvaṁ) saṃvaraṇe bhvādiḥ"
  },
  'cIv1_cIvqz_BvAxiH_AxAne': {
    dev: "चीव् (चीवृँ) आदाने भ्वादिः",
    rom: "cīv (cīvṛṁ) ādāne bhvādiḥ"
  },
  'cIv1_cIvqz_BvAxiH_saMvaraNe': {
    dev: "चीव् (चीवृँ) संवरणे भ्वादिः",
    rom: "cīv (cīvṛṁ) saṃvaraṇe bhvādiḥ"
  },
  'cukk1_cukkaz_curAxiH_vyaWane': {
    dev: "चुक्क् (चुक्कँ) व्यथने चुरादिः",
    rom: "cukk (cukkaṁ) vyathane curādiḥ"
  },
  'cut3_cutaz_curAxiH_Cexane': {
    dev: "चुट् (चुटँ) छेदने चुरादिः",
    rom: "cuṭ (cuṭaṁ) chedane curādiḥ"
  },
  'cut2_cutaz_wuxAxiH_Cexane': {
    dev: "चुट् (चुटँ) छेदने तुदादिः",
    rom: "cuṭ (cuṭaṁ) chedane tudādiḥ"
  },
  'cut1_cutiz_BvAxiH_alpIBAve': {
    dev: "चुट् (चुटिँ) अल्पीभावे भ्वादिः",
    rom: "cuṭ (cuṭiṁ) alpībhāve bhvādiḥ"
  },
  'cut4_cutiz_curAxiH_Cexane': {
    dev: "चुट् (चुटिँ) छेदने चुरादिः",
    rom: "cuṭ (cuṭiṁ) chedane curādiḥ"
  },
  'cud2_cudaz_wuxAxiH_saMvaraNe': {
    dev: "चुड् (चुडँ) संवरणे तुदादिः",
    rom: "cuḍ (cuḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'cud1_cudiz_BvAxiH_alpIBAve': {
    dev: "चुड् (चुडिँ) अल्पीभावे भ्वादिः",
    rom: "cuḍ (cuḍiṁ) alpībhāve bhvādiḥ"
  },
  'cuwt1_cuwtaz_curAxiH_alpIBAve': {
    dev: "चुत्ट् (चुत्टँ) अल्पीभावे चुरादिः",
    rom: "cutṭ (cutṭaṁ) alpībhāve curādiḥ"
  },
  'cux1_cuxaz_curAxiH_saFcoxane': {
    dev: "चुद् (चुदँ) सञ्चोदने चुरादिः",
    rom: "cud (cudaṁ) sañcodane curādiḥ"
  },
  'cuxd1_cuxdaz_BvAxiH_BAvakaraNe': {
    dev: "चुद्ड् (चुद्डँ) भावकरणे भ्वादिः",
    rom: "cudḍ (cudḍaṁ) bhāvakaraṇe bhvādiḥ"
  },
  'cuxd1_cuxdaz_BvAxiH_hAvavaraNe': {
    dev: "चुद्ड् (चुद्डँ) हाववरणे भ्वादिः",
    rom: "cudḍ (cudḍaṁ) hāvavaraṇe bhvādiḥ"
  },
  'cup1_cupaz_BvAxiH_manxAyAM_gawO': {
    dev: "चुप् (चुपँ) मन्दायां_गतौ भ्वादिः",
    rom: "cup (cupaṁ) mandāyāṃ_gatau bhvādiḥ"
  },
  'cub1_cubiz_BvAxiH_vakwrasaMyoge': {
    dev: "चुब् (चुबिँ) वक्त्रसंयोगे भ्वादिः",
    rom: "cub (cubiṁ) vaktrasaṃyoge bhvādiḥ"
  },
  'cub2_cubiz_curAxiH_hiMsAyAm': {
    dev: "चुब् (चुबिँ) हिंसायाम् चुरादिः",
    rom: "cub (cubiṁ) hiṃsāyām curādiḥ"
  },
  'cur1_curaz_curAxiH_sweye': {
    dev: "चुर् (चुरँ) स्तेये चुरादिः",
    rom: "cur (curaṁ) steye curādiḥ"
  },
  'cul1_culaz_curAxiH_samucCrAye': {
    dev: "चुल् (चुलँ) समुच्छ्राये चुरादिः",
    rom: "cul (culaṁ) samucchrāye curādiḥ"
  },
  'cull1_cullaz_BvAxiH_BAvakaraNe': {
    dev: "चुल्ल् (चुल्लँ) भावकरणे भ्वादिः",
    rom: "cull (cullaṁ) bhāvakaraṇe bhvādiḥ"
  },
  'cull1_cullaz_BvAxiH_hAvakaraNe': {
    dev: "चुल्ल् (चुल्लँ) हावकरणे भ्वादिः",
    rom: "cull (cullaṁ) hāvakaraṇe bhvādiḥ"
  },
  'cuv1_cuviz_curAxiH_hiMsAyAm': {
    dev: "चुव् (चुविँ) हिंसायाम् चुरादिः",
    rom: "cuv (cuviṁ) hiṃsāyām curādiḥ"
  },
  'cUN1_cUNaz_curAxiH_safkocane': {
    dev: "चूण् (चूणँ) सङ्कोचने चुरादिः",
    rom: "cūṇ (cūṇaṁ) saṅkocane curādiḥ"
  },
  'cUr1_cUrIz_xivAxiH_xAhe': {
    dev: "चूर् (चूरीँ) दाहे दिवादिः",
    rom: "cūr (cūrīṁ) dāhe divādiḥ"
  },
  'cUrN1_cUrNaz_curAxiH_preraNe': {
    dev: "चूर्ण् (चूर्णँ) प्रेरणे चुरादिः",
    rom: "cūrṇ (cūrṇaṁ) preraṇe curādiḥ"
  },
  'cUrN1_cUrNaz_curAxiH_safkocane': {
    dev: "चूर्ण् (चूर्णँ) सङ्कोचने चुरादिः",
    rom: "cūrṇ (cūrṇaṁ) saṅkocane curādiḥ"
  },
  'cUR1_cURaz_BvAxiH_pAne': {
    dev: "चूष् (चूषँ) पाने भ्वादिः",
    rom: "cūṣ (cūṣaṁ) pāne bhvādiḥ"
  },
  'cqw1_cqwIz_wuxAxiH_granWe': {
    dev: "चृत् (चृतीँ) ग्रन्थे तुदादिः",
    rom: "cṛt (cṛtīṁ) granthe tudādiḥ"
  },
  'cqw1_cqwIz_wuxAxiH_hiMsAyAm': {
    dev: "चृत् (चृतीँ) हिंसायाम् तुदादिः",
    rom: "cṛt (cṛtīṁ) hiṃsāyām tudādiḥ"
  },
  'cel1_celqz_BvAxiH_calane': {
    dev: "चेल् (चेलृँ) चलने भ्वादिः",
    rom: "cel (celṛṁ) calane bhvādiḥ"
  },
  'cell1_cellaz_BvAxiH_calane': {
    dev: "चेल्ल् (चेल्लँ) चलने भ्वादिः",
    rom: "cell (cellaṁ) calane bhvādiḥ"
  },
  'ceRt1_ceRtaz_BvAxiH_ceRtAyAm': {
    dev: "चेष्ट् (चेष्टँ) चेष्टायाम् भ्वादिः",
    rom: "ceṣṭ (ceṣṭaṁ) ceṣṭāyām bhvādiḥ"
  },
  'cyu2_cyu_curAxiH_sahane': {
    dev: "च्यु (च्यु) सहने चुरादिः",
    rom: "cyu (cyu) sahane curādiḥ"
  },
  'cyu2_cyu_curAxiH_hasane': {
    dev: "च्यु (च्यु) हसने चुरादिः",
    rom: "cyu (cyu) hasane curādiḥ"
  },
  'cyu1_cyuf_BvAxiH_gawO': {
    dev: "च्यु (च्युङ्) गतौ भ्वादिः",
    rom: "cyu (cyuṅ) gatau bhvādiḥ"
  },
  'cyuw1_cyuwizr_BvAxiH_Asecane': {
    dev: "च्युत् (च्युतिँर्) आसेचने भ्वादिः",
    rom: "cyut (cyutiṁr) āsecane bhvādiḥ"
  },
  'Caxa1_Caxa_curAxiH_apavAraNe': {
    dev: "छद (छद) अपवारणे चुरादिः",
    rom: "chada (chada) apavāraṇe curādiḥ"
  },
  'Cax1_Caxaz_curAxiH_apavAraNe': {
    dev: "छद् (छदँ) अपवारणे चुरादिः",
    rom: "chad (chadaṁ) apavāraṇe curādiḥ"
  },
  'Cax1_Caxaz_curAxiH_saMvaraNe': {
    dev: "छद् (छदँ) संवरणे चुरादिः",
    rom: "chad (chadaṁ) saṃvaraṇe curādiḥ"
  },
  'Cax2_Caxiz_curAxiH_saMvaraNe': {
    dev: "छद् (छदिँ) संवरणे चुरादिः",
    rom: "chad (chadiṁ) saṃvaraṇe curādiḥ"
  },
  'Cap1_Capiz_curAxiH_gawyAm': {
    dev: "छप् (छपिँ) गत्याम् चुरादिः",
    rom: "chap (chapiṁ) gatyām curādiḥ"
  },
  'Cam1_Camuz_BvAxiH_axane': {
    dev: "छम् (छमुँ) अदने भ्वादिः",
    rom: "cham (chamuṁ) adane bhvādiḥ"
  },
  'Carx1_Carxaz_curAxiH_vamane': {
    dev: "छर्द् (छर्दँ) वमने चुरादिः",
    rom: "chard (chardaṁ) vamane curādiḥ"
  },
  'CaR1_CaRaz_BvAxiH_hiMsAyAm': {
    dev: "छष् (छषँ) हिंसायाम् भ्वादिः",
    rom: "chaṣ (chaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'Cix1_Cixizr_ruXAxiH_xvEXIkaraNe': {
    dev: "छिद् (छिदिँर्) द्वैधीकरणे रुधादिः",
    rom: "chid (chidiṁr) dvaidhīkaraṇe rudhādiḥ"
  },
  'Cixra1_Cixra_curAxiH_karNaBexe': {
    dev: "छिद्र (छिद्र) कर्णभेदे चुरादिः",
    rom: "chidra (chidra) karṇabhede curādiḥ"
  },
  'Cixra1_Cixra_curAxiH_Bexane': {
    dev: "छिद्र (छिद्र) भेदने चुरादिः",
    rom: "chidra (chidra) bhedane curādiḥ"
  },
  'Cut2_Cutaz_curAxiH_Cexane': {
    dev: "छुट् (छुटँ) छेदने चुरादिः",
    rom: "chuṭ (chuṭaṁ) chedane curādiḥ"
  },
  'Cut1_Cutaz_wuxAxiH_Cexane': {
    dev: "छुट् (छुटँ) छेदने तुदादिः",
    rom: "chuṭ (chuṭaṁ) chedane tudādiḥ"
  },
  'Cup1_Cupaz_wuxAxiH_sparSane': {
    dev: "छुप् (छुपँ) स्पर्शने तुदादिः",
    rom: "chup (chupaṁ) sparśane tudādiḥ"
  },
  'Cur1_Curaz_wuxAxiH_Cexane': {
    dev: "छुर् (छुरँ) छेदने तुदादिः",
    rom: "chur (churaṁ) chedane tudādiḥ"
  },
  'Cqx1_uzCqxizr_ruXAxiH_xIpwO': {
    dev: "छृद् (उँछृदिँर्) दीप्तौ रुधादिः",
    rom: "chṛd (uṁchṛdiṁr) dīptau rudhādiḥ"
  },
  'Cqx1_uzCqxizr_ruXAxiH_xevane': {
    dev: "छृद् (उँछृदिँर्) देवने रुधादिः",
    rom: "chṛd (uṁchṛdiṁr) devane rudhādiḥ"
  },
  'Cqx2_CqxIz_curAxiH_sanxIpane': {
    dev: "छृद् (छृदीँ) सन्दीपने चुरादिः",
    rom: "chṛd (chṛdīṁ) sandīpane curādiḥ"
  },
  'Cexa1_Cexa_curAxiH_xvEXIkaraNe': {
    dev: "छेद (छेद) द्वैधीकरणे चुरादिः",
    rom: "cheda (cheda) dvaidhīkaraṇe curādiḥ"
  },
  'Co1_Co_xivAxiH_Cexane': {
    dev: "छो (छो) छेदने दिवादिः",
    rom: "cho (cho) chedane divādiḥ"
  },
  'Co1_Co_xivAxiH_Coxane': {
    dev: "छो (छो) छोदने दिवादिः",
    rom: "cho (cho) chodane divādiḥ"
  },
  'Cyu1_Cyuf_BvAxiH_gawO': {
    dev: "छ्यु (छ्युङ्) गतौ भ्वादिः",
    rom: "chyu (chyuṅ) gatau bhvādiḥ"
  },
  'jakR1_jakRaz_axAxiH_BakRaNe': {
    dev: "जक्ष् (जक्षँ) भक्षणे अदादिः",
    rom: "jakṣ (jakṣaṁ) bhakṣaṇe adādiḥ"
  },
  'jakR1_jakRaz_axAxiH_hasane': {
    dev: "जक्ष् (जक्षँ) हसने अदादिः",
    rom: "jakṣ (jakṣaṁ) hasane adādiḥ"
  },
  'jaj1_jajaz_BvAxiH_yuxXe': {
    dev: "जज् (जजँ) युद्धे भ्वादिः",
    rom: "jaj (jajaṁ) yuddhe bhvādiḥ"
  },
  'jaj2_jajiz_BvAxiH_yuxXe': {
    dev: "जज् (जजिँ) युद्धे भ्वादिः",
    rom: "jaj (jajiṁ) yuddhe bhvādiḥ"
  },
  'jat1_jataz_BvAxiH_safGAwe': {
    dev: "जट् (जटँ) सङ्घाते भ्वादिः",
    rom: "jaṭ (jaṭaṁ) saṅghāte bhvādiḥ"
  },
  'jan1_janaz_juhowyAxiH_janane': {
    dev: "जन् (जनँ) जनने जुहोत्यादिः",
    rom: "jan (janaṁ) janane juhotyādiḥ"
  },
  'jan2_janIz_xivAxiH_prAxurBAve': {
    dev: "जन् (जनीँ) प्रादुर्भावे दिवादिः",
    rom: "jan (janīṁ) prādurbhāve divādiḥ"
  },
  'jap1_japaz_BvAxiH_mAnase': {
    dev: "जप् (जपँ) मानसे भ्वादिः",
    rom: "jap (japaṁ) mānase bhvādiḥ"
  },
  'jap1_japaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "जप् (जपँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "jap (japaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'jaB3_jaBaz_BvAxiH_gAwravinAme': {
    dev: "जभ् (जभँ) गात्रविनामे भ्वादिः",
    rom: "jabh (jabhaṁ) gātravināme bhvādiḥ"
  },
  'jaB2_jaBiz_curAxiH_nASane': {
    dev: "जभ् (जभिँ) नाशने चुरादिः",
    rom: "jabh (jabhiṁ) nāśane curādiḥ"
  },
  'jaB1_jaBIz_BvAxiH_gAwravinAme': {
    dev: "जभ् (जभीँ) गात्रविनामे भ्वादिः",
    rom: "jabh (jabhīṁ) gātravināme bhvādiḥ"
  },
  'jam1_jamuz_BvAxiH_axane': {
    dev: "जम् (जमुँ) अदने भ्वादिः",
    rom: "jam (jamuṁ) adane bhvādiḥ"
  },
  'jarc1_jarcaz_wuxAxiH_pariBARaNe': {
    dev: "जर्च् (जर्चँ) परिभाषणे तुदादिः",
    rom: "jarc (jarcaṁ) paribhāṣaṇe tudādiḥ"
  },
  'jarc1_jarcaz_wuxAxiH_sanwarjane': {
    dev: "जर्च् (जर्चँ) सन्तर्जने तुदादिः",
    rom: "jarc (jarcaṁ) santarjane tudādiḥ"
  },
  'jarj1_jarjaz_BvAxiH_warjane': {
    dev: "जर्ज् (जर्जँ) तर्जने भ्वादिः",
    rom: "jarj (jarjaṁ) tarjane bhvādiḥ"
  },
  'jarj2_jarjaz_wuxAxiH_pariBARaNe': {
    dev: "जर्ज् (जर्जँ) परिभाषणे तुदादिः",
    rom: "jarj (jarjaṁ) paribhāṣaṇe tudādiḥ"
  },
  'jarj1_jarjaz_BvAxiH_pariBARaNe': {
    dev: "जर्ज् (जर्जँ) परिभाषणे भ्वादिः",
    rom: "jarj (jarjaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'jarj2_jarjaz_wuxAxiH_Barwsane': {
    dev: "जर्ज् (जर्जँ) भर्त्सने तुदादिः",
    rom: "jarj (jarjaṁ) bhartsane tudādiḥ"
  },
  'jarj1_jarjaz_BvAxiH_sanwarjane': {
    dev: "जर्ज् (जर्जँ) सन्तर्जने भ्वादिः",
    rom: "jarj (jarjaṁ) santarjane bhvādiḥ"
  },
  'jarj1_jarjaz_BvAxiH_hiMsAyAm': {
    dev: "जर्ज् (जर्जँ) हिंसायाम् भ्वादिः",
    rom: "jarj (jarjaṁ) hiṃsāyām bhvādiḥ"
  },
  'jal2_jalaz_curAxiH_apavAraNe': {
    dev: "जल् (जलँ) अपवारणे चुरादिः",
    rom: "jal (jalaṁ) apavāraṇe curādiḥ"
  },
  'jal1_jalaz_BvAxiH_GAwane': {
    dev: "जल् (जलँ) घातने भ्वादिः",
    rom: "jal (jalaṁ) ghātane bhvādiḥ"
  },
  'jal1_jalaz_BvAxiH_XAnye': {
    dev: "जल् (जलँ) धान्ये भ्वादिः",
    rom: "jal (jalaṁ) dhānye bhvādiḥ"
  },
  'jalp1_jalpaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "जल्प् (जल्पँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "jalp (jalpaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'jaR1_jaRaz_BvAxiH_hiMsAyAm': {
    dev: "जष् (जषँ) हिंसायाम् भ्वादिः",
    rom: "jaṣ (jaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'jas4_jasaz_curAxiH_wAdane': {
    dev: "जस् (जसँ) ताडने चुरादिः",
    rom: "jas (jasaṁ) tāḍane curādiḥ"
  },
  'jas2_jasiz_curAxiH_rakRaNe': {
    dev: "जस् (जसिँ) रक्षणे चुरादिः",
    rom: "jas (jasiṁ) rakṣaṇe curādiḥ"
  },
  'jas3_jasuz_curAxiH_wAdane': {
    dev: "जस् (जसुँ) ताडने चुरादिः",
    rom: "jas (jasuṁ) tāḍane curādiḥ"
  },
  'jas1_jasuz_xivAxiH_mokRaNe': {
    dev: "जस् (जसुँ) मोक्षणे दिवादिः",
    rom: "jas (jasuṁ) mokṣaṇe divādiḥ"
  },
  'jas3_jasuz_curAxiH_hiMsAyAm': {
    dev: "जस् (जसुँ) हिंसायाम् चुरादिः",
    rom: "jas (jasuṁ) hiṃsāyām curādiḥ"
  },
  'jAgq1_jAgq_axAxiH_nixrAkRaye': {
    dev: "जागृ (जागृ) निद्राक्षये अदादिः",
    rom: "jāgṛ (jāgṛ) nidrākṣaye adādiḥ"
  },
  'ji1_ji_BvAxiH_aBiBave': {
    dev: "जि (जि) अभिभवे भ्वादिः",
    rom: "ji (ji) abhibhave bhvādiḥ"
  },
  'ji1_ji_BvAxiH_jaye': {
    dev: "जि (जि) जये भ्वादिः",
    rom: "ji (ji) jaye bhvādiḥ"
  },
  'jiri1_jiri_svAxiH_hiMsAyAm': {
    dev: "जिरि (जिरि) हिंसायाम् स्वादिः",
    rom: "jiri (jiri) hiṃsāyām svādiḥ"
  },
  'jiv1_jiviz_BvAxiH_prINane': {
    dev: "जिव् (जिविँ) प्रीणने भ्वादिः",
    rom: "jiv (jiviṁ) prīṇane bhvādiḥ"
  },
  'jiR1_jiRuz_BvAxiH_secane': {
    dev: "जिष् (जिषुँ) सेचने भ्वादिः",
    rom: "jiṣ (jiṣuṁ) secane bhvādiḥ"
  },
  'jiR1_jiRuz_BvAxiH_sevane': {
    dev: "जिष् (जिषुँ) सेवने भ्वादिः",
    rom: "jiṣ (jiṣuṁ) sevane bhvādiḥ"
  },
  'jIv1_jIvaz_BvAxiH_prANaXAraNe': {
    dev: "जीव् (जीवँ) प्राणधारणे भ्वादिः",
    rom: "jīv (jīvaṁ) prāṇadhāraṇe bhvādiḥ"
  },
  'jug1_jugiz_BvAxiH_varjane': {
    dev: "जुग् (जुगिँ) वर्जने भ्वादिः",
    rom: "jug (jugiṁ) varjane bhvādiḥ"
  },
  'juc1_juciz_curAxiH_BARArWe': {
    dev: "जुच् (जुचिँ) भाषार्थे चुरादिः",
    rom: "juc (juciṁ) bhāṣārthe curādiḥ"
  },
  'jud1_judaz_wuxAxiH_gawO': {
    dev: "जुड् (जुडँ) गतौ तुदादिः",
    rom: "juḍ (juḍaṁ) gatau tudādiḥ"
  },
  'jud2_judaz_curAxiH_preraNe': {
    dev: "जुड् (जुडँ) प्रेरणे चुरादिः",
    rom: "juḍ (juḍaṁ) preraṇe curādiḥ"
  },
  'jud1_judaz_wuxAxiH_banXane': {
    dev: "जुड् (जुडँ) बन्धने तुदादिः",
    rom: "juḍ (juḍaṁ) bandhane tudādiḥ"
  },
  'juw1_juwqz_BvAxiH_BAsane': {
    dev: "जुत् (जुतृँ) भासने भ्वादिः",
    rom: "jut (jutṛṁ) bhāsane bhvādiḥ"
  },
  'jun1_junaz_wuxAxiH_gawO': {
    dev: "जुन् (जुनँ) गतौ तुदादिः",
    rom: "jun (junaṁ) gatau tudādiḥ"
  },
  'juR2_juRaz_curAxiH_pariwarkaNe': {
    dev: "जुष् (जुषँ) परितर्कणे चुरादिः",
    rom: "juṣ (juṣaṁ) paritarkaṇe curādiḥ"
  },
  'juR2_juRaz_curAxiH_pariwarpaNe': {
    dev: "जुष् (जुषँ) परितर्पणे चुरादिः",
    rom: "juṣ (juṣaṁ) paritarpaṇe curādiḥ"
  },
  'juR1_juRIz_wuxAxiH_prIwO': {
    dev: "जुष् (जुषीँ) प्रीतौ तुदादिः",
    rom: "juṣ (juṣīṁ) prītau tudādiḥ"
  },
  'juR1_juRIz_wuxAxiH_sevane': {
    dev: "जुष् (जुषीँ) सेवने तुदादिः",
    rom: "juṣ (juṣīṁ) sevane tudādiḥ"
  },
  'jUr1_jUrIz_xivAxiH_vayohAnO': {
    dev: "जूर् (जूरीँ) वयोहानौ दिवादिः",
    rom: "jūr (jūrīṁ) vayohānau divādiḥ"
  },
  'jUr1_jUrIz_xivAxiH_hiMsAyAm': {
    dev: "जूर् (जूरीँ) हिंसायाम् दिवादिः",
    rom: "jūr (jūrīṁ) hiṃsāyām divādiḥ"
  },
  'jUR1_jURaz_BvAxiH_hiMsAyAm': {
    dev: "जूष् (जूषँ) हिंसायाम् भ्वादिः",
    rom: "jūṣ (jūṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'jq1_jq_BvAxiH_aBiBave': {
    dev: "जृ (जृ) अभिभवे भ्वादिः",
    rom: "jṛ (jṛ) abhibhave bhvādiḥ"
  },
  'jqB1_jqBiz_BvAxiH_gAwravinAme': {
    dev: "जृभ् (जृभिँ) गात्रविनामे भ्वादिः",
    rom: "jṛbh (jṛbhiṁ) gātravināme bhvādiḥ"
  },
  'jQ2_jQ_kryAxiH_vayohAnO': {
    dev: "जॄ (जॄ) वयोहानौ क्र्यादिः",
    rom: "jṝ (jṝ) vayohānau kryādiḥ"
  },
  'jQ3_jQ_curAxiH_vayohAnO': {
    dev: "जॄ (जॄ) वयोहानौ चुरादिः",
    rom: "jṝ (jṝ) vayohānau curādiḥ"
  },
  'jQ1_jQR_xivAxiH_vayohAnO': {
    dev: "जॄ (जॄष्) वयोहानौ दिवादिः",
    rom: "jṝ (jṝṣ) vayohānau divādiḥ"
  },
  'jeR1_jeRqz_BvAxiH_gawO': {
    dev: "जेष् (जेषृँ) गतौ भ्वादिः",
    rom: "jeṣ (jeṣṛṁ) gatau bhvādiḥ"
  },
  'jeh1_jehqz_BvAxiH_prayawne': {
    dev: "जेह् (जेहृँ) प्रयत्ने भ्वादिः",
    rom: "jeh (jehṛṁ) prayatne bhvādiḥ"
  },
  'jE1_jE_BvAxiH_kRaye': {
    dev: "जै (जै) क्षये भ्वादिः",
    rom: "jai (jai) kṣaye bhvādiḥ"
  },
  'jFap1_jFapaz_curAxiH_woRaNe': {
    dev: "ज्ञप् (ज्ञपँ) तोषणे चुरादिः",
    rom: "jñap (jñapaṁ) toṣaṇe curādiḥ"
  },
  'jFap1_jFapaz_curAxiH_niSAmane': {
    dev: "ज्ञप् (ज्ञपँ) निशामने चुरादिः",
    rom: "jñap (jñapaṁ) niśāmane curādiḥ"
  },
  'jFap1_jFapaz_curAxiH_mAraNe': {
    dev: "ज्ञप् (ज्ञपँ) मारणे चुरादिः",
    rom: "jñap (jñapaṁ) māraṇe curādiḥ"
  },
  'jFap1_jFapaz_curAxiH_micca': {
    dev: "ज्ञप् (ज्ञपँ) मिच्च चुरादिः",
    rom: "jñap (jñapaṁ) micca curādiḥ"
  },
  'jFA1_jFA_kryAxiH_avaboXane': {
    dev: "ज्ञा (ज्ञा) अवबोधने क्र्यादिः",
    rom: "jñā (jñā) avabodhane kryādiḥ"
  },
  'jFA2_jFA_curAxiH_niyoge': {
    dev: "ज्ञा (ज्ञा) नियोगे चुरादिः",
    rom: "jñā (jñā) niyoge curādiḥ"
  },
  'jFA2_jFA_curAxiH_niyojane': {
    dev: "ज्ञा (ज्ञा) नियोजने चुरादिः",
    rom: "jñā (jñā) niyojane curādiḥ"
  },
  'jyA1_jyA_kryAxiH_vayohAnO': {
    dev: "ज्या (ज्या) वयोहानौ क्र्यादिः",
    rom: "jyā (jyā) vayohānau kryādiḥ"
  },
  'jyu1_jyuf_BvAxiH_gawO': {
    dev: "ज्यु (ज्युङ्) गतौ भ्वादिः",
    rom: "jyu (jyuṅ) gatau bhvādiḥ"
  },
  'jri1_jri_BvAxiH_aBiBave': {
    dev: "ज्रि (ज्रि) अभिभवे भ्वादिः",
    rom: "jri (jri) abhibhave bhvādiḥ"
  },
  'jvar1_jvaraz_BvAxiH_roge': {
    dev: "ज्वर् (ज्वरँ) रोगे भ्वादिः",
    rom: "jvar (jvaraṁ) roge bhvādiḥ"
  },
  'jval1_jvalaz_BvAxiH_xIpwO': {
    dev: "ज्वल् (ज्वलँ) दीप्तौ भ्वादिः",
    rom: "jval (jvalaṁ) dīptau bhvādiḥ"
  },
  'Jat1_Jataz_BvAxiH_safGAwe': {
    dev: "झट् (झटँ) सङ्घाते भ्वादिः",
    rom: "jhaṭ (jhaṭaṁ) saṅghāte bhvādiḥ"
  },
  'Jam1_Jamuz_BvAxiH_axane': {
    dev: "झम् (झमुँ) अदने भ्वादिः",
    rom: "jham (jhamuṁ) adane bhvādiḥ"
  },
  'Jarc1_Jarcaz_wuxAxiH_pariBARaNe': {
    dev: "झर्च् (झर्चँ) परिभाषणे तुदादिः",
    rom: "jharc (jharcaṁ) paribhāṣaṇe tudādiḥ"
  },
  'Jarc1_Jarcaz_wuxAxiH_sanwarjane': {
    dev: "झर्च् (झर्चँ) सन्तर्जने तुदादिः",
    rom: "jharc (jharcaṁ) santarjane tudādiḥ"
  },
  'JarC1_JarCaz_BvAxiH_pariBARaNe': {
    dev: "झर्छ् (झर्छँ) परिभाषणे भ्वादिः",
    rom: "jharch (jharchaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'JarJ1_JarJaz_BvAxiH_warjane': {
    dev: "झर्झ् (झर्झँ) तर्जने भ्वादिः",
    rom: "jharjh (jharjhaṁ) tarjane bhvādiḥ"
  },
  'JarJ2_JarJaz_wuxAxiH_pariBARaNe': {
    dev: "झर्झ् (झर्झँ) परिभाषणे तुदादिः",
    rom: "jharjh (jharjhaṁ) paribhāṣaṇe tudādiḥ"
  },
  'JarJ1_JarJaz_BvAxiH_pariBARaNe': {
    dev: "झर्झ् (झर्झँ) परिभाषणे भ्वादिः",
    rom: "jharjh (jharjhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'JarJ2_JarJaz_wuxAxiH_Barwsane': {
    dev: "झर्झ् (झर्झँ) भर्त्सने तुदादिः",
    rom: "jharjh (jharjhaṁ) bhartsane tudādiḥ"
  },
  'JarJ1_JarJaz_BvAxiH_sanwarjane': {
    dev: "झर्झ् (झर्झँ) सन्तर्जने भ्वादिः",
    rom: "jharjh (jharjhaṁ) santarjane bhvādiḥ"
  },
  'JarJ1_JarJaz_BvAxiH_hiMsAyAm': {
    dev: "झर्झ् (झर्झँ) हिंसायाम् भ्वादिः",
    rom: "jharjh (jharjhaṁ) hiṃsāyām bhvādiḥ"
  },
  'JaR1_JaRaz_BvAxiH_AxAne': {
    dev: "झष् (झषँ) आदाने भ्वादिः",
    rom: "jhaṣ (jhaṣaṁ) ādāne bhvādiḥ"
  },
  'JaR1_JaRaz_BvAxiH_saMvaraNe': {
    dev: "झष् (झषँ) संवरणे भ्वादिः",
    rom: "jhaṣ (jhaṣaṁ) saṃvaraṇe bhvādiḥ"
  },
  'JaR1_JaRaz_BvAxiH_hiMsAyAm': {
    dev: "झष् (झषँ) हिंसायाम् भ्वादिः",
    rom: "jhaṣ (jhaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'JQ1_JQR_xivAxiH_vayohAnO': {
    dev: "झॄ (झॄष्) वयोहानौ दिवादिः",
    rom: "jhṝ (jhṝṣ) vayohānau divādiḥ"
  },
  'Jyu1_Jyuf_BvAxiH_gawO': {
    dev: "झ्यु (झ्युङ्) गतौ भ्वादिः",
    rom: "jhyu (jhyuṅ) gatau bhvādiḥ"
  },
  'tak1_takiz_curAxiH_banXane': {
    dev: "टक् (टकिँ) बन्धने चुरादिः",
    rom: "ṭak (ṭakiṁ) bandhane curādiḥ"
  },
  'tal1_talaz_BvAxiH_vEklavye': {
    dev: "टल् (टलँ) वैक्लव्ये भ्वादिः",
    rom: "ṭal (ṭalaṁ) vaiklavye bhvādiḥ"
  },
  'tal1_talaz_BvAxiH_vEplavye': {
    dev: "टल् (टलँ) वैप्लव्ये भ्वादिः",
    rom: "ṭal (ṭalaṁ) vaiplavye bhvādiḥ"
  },
  'tik1_tikqz_BvAxiH_gawO': {
    dev: "टिक् (टिकृँ) गतौ भ्वादिः",
    rom: "ṭik (ṭikṛṁ) gatau bhvādiḥ"
  },
  'tip1_tipaz_curAxiH_kRepe': {
    dev: "टिप् (टिपँ) क्षेपे चुरादिः",
    rom: "ṭip (ṭipaṁ) kṣepe curādiḥ"
  },
  'tIk1_tIkqz_BvAxiH_gawO': {
    dev: "टीक् (टीकृँ) गतौ भ्वादिः",
    rom: "ṭīk (ṭīkṛṁ) gatau bhvādiḥ"
  },
  'tval1_tvalaz_BvAxiH_vEklavye': {
    dev: "ट्वल् (ट्वलँ) वैक्लव्ये भ्वादिः",
    rom: "ṭval (ṭvalaṁ) vaiklavye bhvādiḥ"
  },
  'tval1_tvalaz_BvAxiH_vEplavye': {
    dev: "ट्वल् (ट्वलँ) वैप्लव्ये भ्वादिः",
    rom: "ṭval (ṭvalaṁ) vaiplavye bhvādiḥ"
  },
  'dap1_dapaz_curAxiH_safGAwe': {
    dev: "डप् (डपँ) सङ्घाते चुरादिः",
    rom: "ḍap (ḍapaṁ) saṅghāte curādiḥ"
  },
  'dap2_dapiz_curAxiH_safGAwe': {
    dev: "डप् (डपिँ) सङ्घाते चुरादिः",
    rom: "ḍap (ḍapiṁ) saṅghāte curādiḥ"
  },
  'damba1_dabiz_curAxiH_-': {
    dev: "डम्ब (डबिँ) - चुरादिः",
    rom: "ḍamba (ḍabiṁ) - curādiḥ"
  },
  'dip3_dipaz_curAxiH_kRepe': {
    dev: "डिप् (डिपँ) क्षेपे चुरादिः",
    rom: "ḍip (ḍipaṁ) kṣepe curādiḥ"
  },
  'dip2_dipaz_wuxAxiH_kRepe': {
    dev: "डिप् (डिपँ) क्षेपे तुदादिः",
    rom: "ḍip (ḍipaṁ) kṣepe tudādiḥ"
  },
  'dip1_dipaz_xivAxiH_kRepe': {
    dev: "डिप् (डिपँ) क्षेपे दिवादिः",
    rom: "ḍip (ḍipaṁ) kṣepe divādiḥ"
  },
  'dip4_dipaz_curAxiH_safGAwe': {
    dev: "डिप् (डिपँ) सङ्घाते चुरादिः",
    rom: "ḍip (ḍipaṁ) saṅghāte curādiḥ"
  },
  'dip5_dipiz_curAxiH_safGAwe': {
    dev: "डिप् (डिपिँ) सङ्घाते चुरादिः",
    rom: "ḍip (ḍipiṁ) saṅghāte curādiḥ"
  },
  'dI2_dIf_xivAxiH_gawO': {
    dev: "डी (डीङ्) गतौ दिवादिः",
    rom: "ḍī (ḍīṅ) gatau divādiḥ"
  },
  'dI2_dIf_xivAxiH_vihAyasA_gawO': {
    dev: "डी (डीङ्) विहायसा_गतौ दिवादिः",
    rom: "ḍī (ḍīṅ) vihāyasā_gatau divādiḥ"
  },
  'dI1_dIf_BvAxiH_vihAyasA_gawO': {
    dev: "डी (डीङ्) विहायसा_गतौ भ्वादिः",
    rom: "ḍī (ḍīṅ) vihāyasā_gatau bhvādiḥ"
  },
  'DOk1_DOkqz_BvAxiH_gawO': {
    dev: "ढौक् (ढौकृँ) गतौ भ्वादिः",
    rom: "ḍhauk (ḍhaukṛṁ) gatau bhvādiḥ"
  },
  'NakR1_NakRaz_BvAxiH_gawO': {
    dev: "णक्ष् (णक्षँ) गतौ भ्वादिः",
    rom: "ṇakṣ (ṇakṣaṁ) gatau bhvādiḥ"
  },
  'NaK1_NaKaz_BvAxiH_gawO': {
    dev: "णख् (णखँ) गतौ भ्वादिः",
    rom: "ṇakh (ṇakhaṁ) gatau bhvādiḥ"
  },
  'NaK2_NaKiz_BvAxiH_gawO': {
    dev: "णख् (णखिँ) गतौ भ्वादिः",
    rom: "ṇakh (ṇakhiṁ) gatau bhvādiḥ"
  },
  'Nat1_Nataz_BvAxiH_nqwO': {
    dev: "णट् (णटँ) नृतौ भ्वादिः",
    rom: "ṇaṭ (ṇaṭaṁ) nṛtau bhvādiḥ"
  },
  'Nax1_Naxaz_BvAxiH_avyakwe_Sabxe': {
    dev: "णद् (णदँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "ṇad (ṇadaṁ) avyakte_śabde bhvādiḥ"
  },
  'Nax2_Naxaz_curAxiH_BARArWe': {
    dev: "णद् (णदँ) भाषार्थे चुरादिः",
    rom: "ṇad (ṇadaṁ) bhāṣārthe curādiḥ"
  },
  'Nax2_Naxaz_curAxiH_BAsArWe': {
    dev: "णद् (णदँ) भासार्थे चुरादिः",
    rom: "ṇad (ṇadaṁ) bhāsārthe curādiḥ"
  },
  'Nax1_Naxaz_BvAxiH_Sabxe': {
    dev: "णद् (णदँ) शब्दे भ्वादिः",
    rom: "ṇad (ṇadaṁ) śabde bhvādiḥ"
  },
  'NaB3_NaBaz_kryAxiH_hiMsAyAm': {
    dev: "णभ् (णभँ) हिंसायाम् क्र्यादिः",
    rom: "ṇabh (ṇabhaṁ) hiṃsāyām kryādiḥ"
  },
  'NaB2_NaBaz_xivAxiH_hiMsAyAm': {
    dev: "णभ् (णभँ) हिंसायाम् दिवादिः",
    rom: "ṇabh (ṇabhaṁ) hiṃsāyām divādiḥ"
  },
  'NaB1_NaBaz_BvAxiH_hiMsAyAm': {
    dev: "णभ् (णभँ) हिंसायाम् भ्वादिः",
    rom: "ṇabh (ṇabhaṁ) hiṃsāyām bhvādiḥ"
  },
  'Nam1_Namaz_BvAxiH_prahvawve': {
    dev: "णम् (णमँ) प्रह्वत्वे भ्वादिः",
    rom: "ṇam (ṇamaṁ) prahvatve bhvādiḥ"
  },
  'Nam1_Namaz_BvAxiH_prahvawveSabxe': {
    dev: "णम् (णमँ) प्रह्वत्वेशब्दे भ्वादिः",
    rom: "ṇam (ṇamaṁ) prahvatveśabde bhvādiḥ"
  },
  'Nay1_Nayaz_BvAxiH_gawO': {
    dev: "णय् (णयँ) गतौ भ्वादिः",
    rom: "ṇay (ṇayaṁ) gatau bhvādiḥ"
  },
  'Nay1_Nayaz_BvAxiH_rakRaNe': {
    dev: "णय् (णयँ) रक्षणे भ्वादिः",
    rom: "ṇay (ṇayaṁ) rakṣaṇe bhvādiḥ"
  },
  'Nal1_Nalaz_BvAxiH_ganXane': {
    dev: "णल् (णलँ) गन्धने भ्वादिः",
    rom: "ṇal (ṇalaṁ) gandhane bhvādiḥ"
  },
  'NaS1_NaSaz_xivAxiH_axarSane': {
    dev: "णश् (णशँ) अदर्शने दिवादिः",
    rom: "ṇaś (ṇaśaṁ) adarśane divādiḥ"
  },
  'Nas1_Nasaz_BvAxiH_kOtilye': {
    dev: "णस् (णसँ) कौटिल्ये भ्वादिः",
    rom: "ṇas (ṇasaṁ) kauṭilye bhvādiḥ"
  },
  'Nah1_Nahaz_xivAxiH_baXane': {
    dev: "णह् (णहँ) बधने दिवादिः",
    rom: "ṇah (ṇahaṁ) badhane divādiḥ"
  },
  'Nah1_Nahaz_xivAxiH_banXane': {
    dev: "णह् (णहँ) बन्धने दिवादिः",
    rom: "ṇah (ṇahaṁ) bandhane divādiḥ"
  },
  'NAX1_NAXqz_BvAxiH_ASiRi': {
    dev: "णाध् (णाधृँ) आशिषि भ्वादिः",
    rom: "ṇādh (ṇādhṛṁ) āśiṣi bhvādiḥ"
  },
  'NAX1_NAXqz_BvAxiH_upawApe': {
    dev: "णाध् (णाधृँ) उपतापे भ्वादिः",
    rom: "ṇādh (ṇādhṛṁ) upatāpe bhvādiḥ"
  },
  'NAX1_NAXqz_BvAxiH_ESvarye': {
    dev: "णाध् (णाधृँ) ऐश्वर्ये भ्वादिः",
    rom: "ṇādh (ṇādhṛṁ) aiśvarye bhvādiḥ"
  },
  'NAX1_NAXqz_BvAxiH_yAFcAyAm': {
    dev: "णाध् (णाधृँ) याञ्चायाम् भ्वादिः",
    rom: "ṇādh (ṇādhṛṁ) yāñcāyām bhvādiḥ"
  },
  'NAs1_NAsqz_BvAxiH_Sabxe': {
    dev: "णास् (णासृँ) शब्दे भ्वादिः",
    rom: "ṇās (ṇāsṛṁ) śabde bhvādiḥ"
  },
  'NikR1_NikRaz_BvAxiH_cumbane': {
    dev: "णिक्ष् (णिक्षँ) चुम्बने भ्वादिः",
    rom: "ṇikṣ (ṇikṣaṁ) cumbane bhvādiḥ"
  },
  'Nij1_Nijiz_axAxiH_SuxXO': {
    dev: "णिज् (णिजिँ) शुद्धौ अदादिः",
    rom: "ṇij (ṇijiṁ) śuddhau adādiḥ"
  },
  'Nij2_Nijizr_juhowyAxiH_poRaNe': {
    dev: "णिज् (णिजिँर्) पोषणे जुहोत्यादिः",
    rom: "ṇij (ṇijiṁr) poṣaṇe juhotyādiḥ"
  },
  'Nij2_Nijizr_juhowyAxiH_SOce': {
    dev: "णिज् (णिजिँर्) शौचे जुहोत्यादिः",
    rom: "ṇij (ṇijiṁr) śauce juhotyādiḥ"
  },
  'Nix1_Nixiz_BvAxiH_kuwsAyAm': {
    dev: "णिद् (णिदिँ) कुत्सायाम् भ्वादिः",
    rom: "ṇid (ṇidiṁ) kutsāyām bhvādiḥ"
  },
  'Nix2_Nixqz_BvAxiH_kuwsAyAm': {
    dev: "णिद् (णिदृँ) कुत्सायाम् भ्वादिः",
    rom: "ṇid (ṇidṛṁ) kutsāyām bhvādiḥ"
  },
  'Nix2_Nixqz_BvAxiH_sannikarRe': {
    dev: "णिद् (णिदृँ) सन्निकर्षे भ्वादिः",
    rom: "ṇid (ṇidṛṁ) sannikarṣe bhvādiḥ"
  },
  'Nil1_Nilaz_wuxAxiH_gahane': {
    dev: "णिल् (णिलँ) गहने तुदादिः",
    rom: "ṇil (ṇilaṁ) gahane tudādiḥ"
  },
  'Niv1_Niviz_BvAxiH_secane': {
    dev: "णिव् (णिविँ) सेचने भ्वादिः",
    rom: "ṇiv (ṇiviṁ) secane bhvādiḥ"
  },
  'Niv1_Niviz_BvAxiH_sevane': {
    dev: "णिव् (णिविँ) सेवने भ्वादिः",
    rom: "ṇiv (ṇiviṁ) sevane bhvādiḥ"
  },
  'Niv1_Niviz_BvAxiH_sraMsane': {
    dev: "णिव् (णिविँ) स्रंसने भ्वादिः",
    rom: "ṇiv (ṇiviṁ) sraṃsane bhvādiḥ"
  },
  'NiS1_NiSaz_BvAxiH_samAXO': {
    dev: "णिश् (णिशँ) समाधौ भ्वादिः",
    rom: "ṇiś (ṇiśaṁ) samādhau bhvādiḥ"
  },
  'NiRk1_NiRkaz_curAxiH_parimANe': {
    dev: "णिष्क् (णिष्कँ) परिमाणे चुरादिः",
    rom: "ṇiṣk (ṇiṣkaṁ) parimāṇe curādiḥ"
  },
  'Nis1_Nisiz_axAxiH_gawO': {
    dev: "णिस् (णिसिँ) गतौ अदादिः",
    rom: "ṇis (ṇisiṁ) gatau adādiḥ"
  },
  'Nis1_Nisiz_axAxiH_cumbane': {
    dev: "णिस् (णिसिँ) चुम्बने अदादिः",
    rom: "ṇis (ṇisiṁ) cumbane adādiḥ"
  },
  'Nis1_Nisiz_axAxiH_niSAne': {
    dev: "णिस् (णिसिँ) निशाने अदादिः",
    rom: "ṇis (ṇisiṁ) niśāne adādiḥ"
  },
  'NI1_NIF_BvAxiH_prApaNe': {
    dev: "णी (णीञ्) प्रापणे भ्वादिः",
    rom: "ṇī (ṇīñ) prāpaṇe bhvādiḥ"
  },
  'NIl1_NIlaz_BvAxiH_varNe': {
    dev: "णील् (णीलँ) वर्णे भ्वादिः",
    rom: "ṇīl (ṇīlaṁ) varṇe bhvādiḥ"
  },
  'NIv1_NIvaz_BvAxiH_sWOlye': {
    dev: "णीव् (णीवँ) स्थौल्ये भ्वादिः",
    rom: "ṇīv (ṇīvaṁ) sthaulye bhvādiḥ"
  },
  'Nu1_Nu_axAxiH_swuwO': {
    dev: "णु (णु) स्तुतौ अदादिः",
    rom: "ṇu (ṇu) stutau adādiḥ"
  },
  'Nux1_Nuxaz_wuxAxiH_preraNe': {
    dev: "णुद् (णुदँ) प्रेरणे तुदादिः",
    rom: "ṇud (ṇudaṁ) preraṇe tudādiḥ"
  },
  'NU1_NU_wuxAxiH_swavane': {
    dev: "णू (णू) स्तवने तुदादिः",
    rom: "ṇū (ṇū) stavane tudādiḥ"
  },
  'Nex1_Nexqz_BvAxiH_kuwsAyAm': {
    dev: "णेद् (णेदृँ) कुत्सायाम् भ्वादिः",
    rom: "ṇed (ṇedṛṁ) kutsāyām bhvādiḥ"
  },
  'Nex1_Nexqz_BvAxiH_sannikarRe': {
    dev: "णेद् (णेदृँ) सन्निकर्षे भ्वादिः",
    rom: "ṇed (ṇedṛṁ) sannikarṣe bhvādiḥ"
  },
  'NeR1_NeRqz_BvAxiH_gawO': {
    dev: "णेष् (णेषृँ) गतौ भ्वादिः",
    rom: "ṇeṣ (ṇeṣṛṁ) gatau bhvādiḥ"
  },
  'Nes1_Nesqz_BvAxiH_gawO': {
    dev: "णेस् (णेसृँ) गतौ भ्वादिः",
    rom: "ṇes (ṇesṛṁ) gatau bhvādiḥ"
  },
  'wak1_wakaz_BvAxiH_hasane': {
    dev: "तक् (तकँ) हसने भ्वादिः",
    rom: "tak (takaṁ) hasane bhvādiḥ"
  },
  'wak2_wakiz_BvAxiH_kqcCrajIvane': {
    dev: "तक् (तकिँ) कृच्छ्रजीवने भ्वादिः",
    rom: "tak (takiṁ) kṛcchrajīvane bhvādiḥ"
  },
  'wakR2_wakRaz_BvAxiH_wvacane': {
    dev: "तक्ष् (तक्षँ) त्वचने भ्वादिः",
    rom: "takṣ (takṣaṁ) tvacane bhvādiḥ"
  },
  'wakR1_wakRUz_BvAxiH_wanUkaraNe': {
    dev: "तक्ष् (तक्षूँ) तनूकरणे भ्वादिः",
    rom: "takṣ (takṣūṁ) tanūkaraṇe bhvādiḥ"
  },
  'wag1_wagiz_BvAxiH_gawO': {
    dev: "तग् (तगिँ) गतौ भ्वादिः",
    rom: "tag (tagiṁ) gatau bhvādiḥ"
  },
  'wat1_wataz_BvAxiH_ucCrAye': {
    dev: "तट् (तटँ) उच्छ्राये भ्वादिः",
    rom: "taṭ (taṭaṁ) ucchrāye bhvādiḥ"
  },
  'wad2_wadaz_curAxiH_AGAwe': {
    dev: "तड् (तडँ) आघाते चुरादिः",
    rom: "taḍ (taḍaṁ) āghāte curādiḥ"
  },
  'wad1_wadiz_BvAxiH_wAdane': {
    dev: "तड् (तडिँ) ताडने भ्वादिः",
    rom: "taḍ (taḍiṁ) tāḍane bhvādiḥ"
  },
  'wawr1_wawriz_curAxiH_kutumbaXAraNe': {
    dev: "तत्र् (तत्रिँ) कुटुम्बधारणे चुरादिः",
    rom: "tatr (tatriṁ) kuṭumbadhāraṇe curādiḥ"
  },
  'wan2_wanuz_curAxiH_upakaraNe': {
    dev: "तन् (तनुँ) उपकरणे चुरादिः",
    rom: "tan (tanuṁ) upakaraṇe curādiḥ"
  },
  'wan1_wanuz_wanAxiH_viswAre': {
    dev: "तन् (तनुँ) विस्तारे तनादिः",
    rom: "tan (tanuṁ) vistāre tanādiḥ"
  },
  'wan2_wanuz_curAxiH_SraxXe': {
    dev: "तन् (तनुँ) श्रद्धे चुरादिः",
    rom: "tan (tanuṁ) śraddhe curādiḥ"
  },
  'wanc1_wancuz_BvAxiH_gawO': {
    dev: "तन्च् (तन्चुँ) गतौ भ्वादिः",
    rom: "tanc (tancuṁ) gatau bhvādiḥ"
  },
  'wanc2_wancUz_ruXAxiH_safkocane': {
    dev: "तन्च् (तन्चूँ) सङ्कोचने रुधादिः",
    rom: "tanc (tancūṁ) saṅkocane rudhādiḥ"
  },
  'wap2_wapaz_xivAxiH_ESvarye': {
    dev: "तप् (तपँ) ऐश्वर्ये दिवादिः",
    rom: "tap (tapaṁ) aiśvarye divādiḥ"
  },
  'wap3_wapaz_curAxiH_xAhe': {
    dev: "तप् (तपँ) दाहे चुरादिः",
    rom: "tap (tapaṁ) dāhe curādiḥ"
  },
  'wap1_wapaz_BvAxiH_sanwApe': {
    dev: "तप् (तपँ) सन्तापे भ्वादिः",
    rom: "tap (tapaṁ) santāpe bhvādiḥ"
  },
  'wam1_wamuz_xivAxiH_kAfkRAyAm': {
    dev: "तम् (तमुँ) काङ्क्षायाम् दिवादिः",
    rom: "tam (tamuṁ) kāṅkṣāyām divādiḥ"
  },
  'way1_wayaz_BvAxiH_gawO': {
    dev: "तय् (तयँ) गतौ भ्वादिः",
    rom: "tay (tayaṁ) gatau bhvādiḥ"
  },
  'way1_wayaz_BvAxiH_rakRaNe': {
    dev: "तय् (तयँ) रक्षणे भ्वादिः",
    rom: "tay (tayaṁ) rakṣaṇe bhvādiḥ"
  },
  'wark1_warkaz_curAxiH_BARArWe': {
    dev: "तर्क् (तर्कँ) भाषार्थे चुरादिः",
    rom: "tark (tarkaṁ) bhāṣārthe curādiḥ"
  },
  'wark1_warkaz_curAxiH_BAsArWe': {
    dev: "तर्क् (तर्कँ) भासार्थे चुरादिः",
    rom: "tark (tarkaṁ) bhāsārthe curādiḥ"
  },
  'warj1_warjaz_BvAxiH_Barwsane': {
    dev: "तर्ज् (तर्जँ) भर्त्सने भ्वादिः",
    rom: "tarj (tarjaṁ) bhartsane bhvādiḥ"
  },
  'warj2_warjaz_curAxiH_sanwarjane': {
    dev: "तर्ज् (तर्जँ) सन्तर्जने चुरादिः",
    rom: "tarj (tarjaṁ) santarjane curādiḥ"
  },
  'warx1_warxaz_BvAxiH_hiMsAyAm': {
    dev: "तर्द् (तर्दँ) हिंसायाम् भ्वादिः",
    rom: "tard (tardaṁ) hiṃsāyām bhvādiḥ"
  },
  'wal1_walaz_curAxiH_prawiRTAyAm': {
    dev: "तल् (तलँ) प्रतिष्ठायाम् चुरादिः",
    rom: "tal (talaṁ) pratiṣṭhāyām curādiḥ"
  },
  'was2_wasiz_curAxiH_alafkAre': {
    dev: "तस् (तसिँ) अलङ्कारे चुरादिः",
    rom: "tas (tasiṁ) alaṅkāre curādiḥ"
  },
  'was1_wasuz_xivAxiH_upakRaye': {
    dev: "तस् (तसुँ) उपक्षये दिवादिः",
    rom: "tas (tasuṁ) upakṣaye divādiḥ"
  },
  'was1_wasuz_xivAxiH_prakRepaNe': {
    dev: "तस् (तसुँ) प्रक्षेपणे दिवादिः",
    rom: "tas (tasuṁ) prakṣepaṇe divādiḥ"
  },
  'wAy1_wAyqz_BvAxiH_pAlane': {
    dev: "ताय् (तायृँ) पालने भ्वादिः",
    rom: "tāy (tāyṛṁ) pālane bhvādiḥ"
  },
  'wAy1_wAyqz_BvAxiH_sanwAne': {
    dev: "ताय् (तायृँ) सन्ताने भ्वादिः",
    rom: "tāy (tāyṛṁ) santāne bhvādiḥ"
  },
  'wik2_wikaz_svAxiH_Askanxane': {
    dev: "तिक् (तिकँ) आस्कन्दने स्वादिः",
    rom: "tik (tikaṁ) āskandane svādiḥ"
  },
  'wik1_wikqz_BvAxiH_gawO': {
    dev: "तिक् (तिकृँ) गतौ भ्वादिः",
    rom: "tik (tikṛṁ) gatau bhvādiḥ"
  },
  'wig1_wigaz_svAxiH_Askanxane': {
    dev: "तिग् (तिगँ) आस्कन्दने स्वादिः",
    rom: "tig (tigaṁ) āskandane svādiḥ"
  },
  'wij1_wijaz_BvAxiH_kRamAyAm': {
    dev: "तिज् (तिजँ) क्षमायाम् भ्वादिः",
    rom: "tij (tijaṁ) kṣamāyām bhvādiḥ"
  },
  'wij2_wijaz_curAxiH_niSAne': {
    dev: "तिज् (तिजँ) निशाने चुरादिः",
    rom: "tij (tijaṁ) niśāne curādiḥ"
  },
  'wij1_wijaz_BvAxiH_niSAne': {
    dev: "तिज् (तिजँ) निशाने भ्वादिः",
    rom: "tij (tijaṁ) niśāne bhvādiḥ"
  },
  'wip2_wipaz_curAxiH_kRepe': {
    dev: "तिप् (तिपँ) क्षेपे चुरादिः",
    rom: "tip (tipaṁ) kṣepe curādiḥ"
  },
  'wip1_wipqz_BvAxiH_kRaraNe': {
    dev: "तिप् (तिपृँ) क्षरणे भ्वादिः",
    rom: "tip (tipṛṁ) kṣaraṇe bhvādiḥ"
  },
  'wim1_wimaz_xivAxiH_ArxrIBAve': {
    dev: "तिम् (तिमँ) आर्द्रीभावे दिवादिः",
    rom: "tim (timaṁ) ārdrībhāve divādiḥ"
  },
  'wil1_wilaz_BvAxiH_gawO': {
    dev: "तिल् (तिलँ) गतौ भ्वादिः",
    rom: "til (tilaṁ) gatau bhvādiḥ"
  },
  'wil3_wilaz_curAxiH_snehane': {
    dev: "तिल् (तिलँ) स्नेहने चुरादिः",
    rom: "til (tilaṁ) snehane curādiḥ"
  },
  'wil2_wilaz_wuxAxiH_snehane': {
    dev: "तिल् (तिलँ) स्नेहने तुदादिः",
    rom: "til (tilaṁ) snehane tudādiḥ"
  },
  'will1_willaz_BvAxiH_gawO': {
    dev: "तिल्ल् (तिल्लँ) गतौ भ्वादिः",
    rom: "till (tillaṁ) gatau bhvādiḥ"
  },
  'wIm1_wImaz_xivAxiH_ArxrIBAve': {
    dev: "तीम् (तीमँ) आर्द्रीभावे दिवादिः",
    rom: "tīm (tīmaṁ) ārdrībhāve divādiḥ"
  },
  'wIra1_wIra_curAxiH_karmasamApwO': {
    dev: "तीर (तीर) कर्मसमाप्तौ चुरादिः",
    rom: "tīra (tīra) karmasamāptau curādiḥ"
  },
  'wIv1_wIvaz_BvAxiH_sWOlye': {
    dev: "तीव् (तीवँ) स्थौल्ये भ्वादिः",
    rom: "tīv (tīvaṁ) sthaulye bhvādiḥ"
  },
  'wuj1_wujaz_BvAxiH_hiMsAyAm': {
    dev: "तुज् (तुजँ) हिंसायाम् भ्वादिः",
    rom: "tuj (tujaṁ) hiṃsāyām bhvādiḥ"
  },
  'wuj3_wujiz_curAxiH_nikewane': {
    dev: "तुज् (तुजिँ) निकेतने चुरादिः",
    rom: "tuj (tujiṁ) niketane curādiḥ"
  },
  'wuj2_wujiz_BvAxiH_pAlane': {
    dev: "तुज् (तुजिँ) पालने भ्वादिः",
    rom: "tuj (tujiṁ) pālane bhvādiḥ"
  },
  'wuj3_wujiz_curAxiH_balAxAne': {
    dev: "तुज् (तुजिँ) बलादाने चुरादिः",
    rom: "tuj (tujiṁ) balādāne curādiḥ"
  },
  'wuj3_wujiz_curAxiH_BARArWe': {
    dev: "तुज् (तुजिँ) भाषार्थे चुरादिः",
    rom: "tuj (tujiṁ) bhāṣārthe curādiḥ"
  },
  'wuj3_wujiz_curAxiH_BAsArWe': {
    dev: "तुज् (तुजिँ) भासार्थे चुरादिः",
    rom: "tuj (tujiṁ) bhāsārthe curādiḥ"
  },
  'wuj3_wujiz_curAxiH_hiMsAyAm': {
    dev: "तुज् (तुजिँ) हिंसायाम् चुरादिः",
    rom: "tuj (tujiṁ) hiṃsāyām curādiḥ"
  },
  'wuj2_wujiz_BvAxiH_hiMsAyAm': {
    dev: "तुज् (तुजिँ) हिंसायाम् भ्वादिः",
    rom: "tuj (tujiṁ) hiṃsāyām bhvādiḥ"
  },
  'wut1_wutaz_wuxAxiH_kalahakarmaNi': {
    dev: "तुट् (तुटँ) कलहकर्मणि तुदादिः",
    rom: "tuṭ (tuṭaṁ) kalahakarmaṇi tudādiḥ"
  },
  'wud3_wudaz_wuxAxiH_wodane': {
    dev: "तुड् (तुडँ) तोडने तुदादिः",
    rom: "tuḍ (tuḍaṁ) toḍane tudādiḥ"
  },
  'wud2_wudiz_BvAxiH_wodane': {
    dev: "तुड् (तुडिँ) तोडने भ्वादिः",
    rom: "tuḍ (tuḍiṁ) toḍane bhvādiḥ"
  },
  'wud1_wudqz_BvAxiH_wodane': {
    dev: "तुड् (तुडृँ) तोडने भ्वादिः",
    rom: "tuḍ (tuḍṛṁ) toḍane bhvādiḥ"
  },
  'wuN1_wuNaz_wuxAxiH_kOtilye': {
    dev: "तुण् (तुणँ) कौटिल्ये तुदादिः",
    rom: "tuṇ (tuṇaṁ) kauṭilye tudādiḥ"
  },
  'wuwWa1_wuwWa_curAxiH_AvaraNe': {
    dev: "तुत्थ (तुत्थ) आवरणे चुरादिः",
    rom: "tuttha (tuttha) āvaraṇe curādiḥ"
  },
  'wux1_wuxaz_wuxAxiH_vyaWane': {
    dev: "तुद् (तुदँ) व्यथने तुदादिः",
    rom: "tud (tudaṁ) vyathane tudādiḥ"
  },
  'wunp2_wunpaz_wuxAxiH_hiMsAyAm': {
    dev: "तुन्प् (तुन्पँ) हिंसायाम् तुदादिः",
    rom: "tunp (tunpaṁ) hiṃsāyām tudādiḥ"
  },
  'wunp1_wunpaz_BvAxiH_hiMsAyAm': {
    dev: "तुन्प् (तुन्पँ) हिंसायाम् भ्वादिः",
    rom: "tunp (tunpaṁ) hiṃsāyām bhvādiḥ"
  },
  'wunP2_wunPaz_wuxAxiH_hiMsAyAm': {
    dev: "तुन्फ् (तुन्फँ) हिंसायाम् तुदादिः",
    rom: "tunph (tunphaṁ) hiṃsāyām tudādiḥ"
  },
  'wunP1_wunPaz_BvAxiH_hiMsAyAm': {
    dev: "तुन्फ् (तुन्फँ) हिंसायाम् भ्वादिः",
    rom: "tunph (tunphaṁ) hiṃsāyām bhvādiḥ"
  },
  'wup2_wupaz_wuxAxiH_hiMsAyAm': {
    dev: "तुप् (तुपँ) हिंसायाम् तुदादिः",
    rom: "tup (tupaṁ) hiṃsāyām tudādiḥ"
  },
  'wup1_wupaz_BvAxiH_hiMsAyAm': {
    dev: "तुप् (तुपँ) हिंसायाम् भ्वादिः",
    rom: "tup (tupaṁ) hiṃsāyām bhvādiḥ"
  },
  'wup3_wupiz_curAxiH_arxane': {
    dev: "तुप् (तुपिँ) अर्दने चुरादिः",
    rom: "tup (tupiṁ) ardane curādiḥ"
  },
  'wuP2_wuPaz_wuxAxiH_hiMsAyAm': {
    dev: "तुफ् (तुफँ) हिंसायाम् तुदादिः",
    rom: "tuph (tuphaṁ) hiṃsāyām tudādiḥ"
  },
  'wuP1_wuPaz_BvAxiH_hiMsAyAm': {
    dev: "तुफ् (तुफँ) हिंसायाम् भ्वादिः",
    rom: "tuph (tuphaṁ) hiṃsāyām bhvādiḥ"
  },
  'wub2_wubiz_curAxiH_axarSane': {
    dev: "तुब् (तुबिँ) अदर्शने चुरादिः",
    rom: "tub (tubiṁ) adarśane curādiḥ"
  },
  'wub2_wubiz_curAxiH_arxane': {
    dev: "तुब् (तुबिँ) अर्दने चुरादिः",
    rom: "tub (tubiṁ) ardane curādiḥ"
  },
  'wub1_wubiz_BvAxiH_arxane': {
    dev: "तुब् (तुबिँ) अर्दने भ्वादिः",
    rom: "tub (tubiṁ) ardane bhvādiḥ"
  },
  'wuB3_wuBaz_kryAxiH_hiMsAyAm': {
    dev: "तुभ् (तुभँ) हिंसायाम् क्र्यादिः",
    rom: "tubh (tubhaṁ) hiṃsāyām kryādiḥ"
  },
  'wuB2_wuBaz_xivAxiH_hiMsAyAm': {
    dev: "तुभ् (तुभँ) हिंसायाम् दिवादिः",
    rom: "tubh (tubhaṁ) hiṃsāyām divādiḥ"
  },
  'wuB1_wuBaz_BvAxiH_hiMsAyAm': {
    dev: "तुभ् (तुभँ) हिंसायाम् भ्वादिः",
    rom: "tubh (tubhaṁ) hiṃsāyām bhvādiḥ"
  },
  'wur1_wuraz_juhowyAxiH_wvaraNe': {
    dev: "तुर् (तुरँ) त्वरणे जुहोत्यादिः",
    rom: "tur (turaṁ) tvaraṇe juhotyādiḥ"
  },
  'wurv1_wurvIz_BvAxiH_hiMsAyAm': {
    dev: "तुर्व् (तुर्वीँ) हिंसायाम् भ्वादिः",
    rom: "turv (turvīṁ) hiṃsāyām bhvādiḥ"
  },
  'wul1_wulaz_curAxiH_unmAne': {
    dev: "तुल् (तुलँ) उन्माने चुरादिः",
    rom: "tul (tulaṁ) unmāne curādiḥ"
  },
  'wuR1_wuRaz_xivAxiH_wuRtO': {
    dev: "तुष् (तुषँ) तुष्टौ दिवादिः",
    rom: "tuṣ (tuṣaṁ) tuṣṭau divādiḥ"
  },
  'wuR1_wuRaz_xivAxiH_prIwO': {
    dev: "तुष् (तुषँ) प्रीतौ दिवादिः",
    rom: "tuṣ (tuṣaṁ) prītau divādiḥ"
  },
  'wus1_wusaz_BvAxiH_Sabxe': {
    dev: "तुस् (तुसँ) शब्दे भ्वादिः",
    rom: "tus (tusaṁ) śabde bhvādiḥ"
  },
  'wuh1_wuhizr_BvAxiH_arxane': {
    dev: "तुह् (तुहिँर्) अर्दने भ्वादिः",
    rom: "tuh (tuhiṁr) ardane bhvādiḥ"
  },
  'wUd1_wUdqz_BvAxiH_wodane': {
    dev: "तूड् (तूडृँ) तोडने भ्वादिः",
    rom: "tūḍ (tūḍṛṁ) toḍane bhvādiḥ"
  },
  'wUN1_wUNaz_curAxiH_pUraNe': {
    dev: "तूण् (तूणँ) पूरणे चुरादिः",
    rom: "tūṇ (tūṇaṁ) pūraṇe curādiḥ"
  },
  'wUr1_wUrIz_xivAxiH_gawiwvaraNe': {
    dev: "तूर् (तूरीँ) गतित्वरणे दिवादिः",
    rom: "tūr (tūrīṁ) gatitvaraṇe divādiḥ"
  },
  'wUr1_wUrIz_xivAxiH_hiMsAyAm': {
    dev: "तूर् (तूरीँ) हिंसायाम् दिवादिः",
    rom: "tūr (tūrīṁ) hiṃsāyām divādiḥ"
  },
  'wUl1_wUlaz_BvAxiH_niRkarRe': {
    dev: "तूल् (तूलँ) निष्कर्षे भ्वादिः",
    rom: "tūl (tūlaṁ) niṣkarṣe bhvādiḥ"
  },
  'wUR1_wURaz_BvAxiH_wuRtO': {
    dev: "तूष् (तूषँ) तुष्टौ भ्वादिः",
    rom: "tūṣ (tūṣaṁ) tuṣṭau bhvādiḥ"
  },
  'wqkR1_wqkRaz_BvAxiH_gawO': {
    dev: "तृक्ष् (तृक्षँ) गतौ भ्वादिः",
    rom: "tṛkṣ (tṛkṣaṁ) gatau bhvādiḥ"
  },
  'wqN1_wqNuz_wanAxiH_axane': {
    dev: "तृण् (तृणुँ) अदने तनादिः",
    rom: "tṛṇ (tṛṇuṁ) adane tanādiḥ"
  },
  'wqx1_uzwqxizr_ruXAxiH_anAxare': {
    dev: "तृद् (उँतृदिँर्) अनादरे रुधादिः",
    rom: "tṛd (uṁtṛdiṁr) anādare rudhādiḥ"
  },
  'wqx1_uzwqxizr_ruXAxiH_hiMsAyAm': {
    dev: "तृद् (उँतृदिँर्) हिंसायाम् रुधादिः",
    rom: "tṛd (uṁtṛdiṁr) hiṃsāyām rudhādiḥ"
  },
  'wqnP1_wqnPaz_wuxAxiH_wqpwO': {
    dev: "तृन्फ् (तृन्फँ) तृप्तौ तुदादिः",
    rom: "tṛnph (tṛnphaṁ) tṛptau tudādiḥ"
  },
  'wqnh1_wqnhUz_wuxAxiH_hiMsAyAm': {
    dev: "तृन्ह् (तृन्हूँ) हिंसायाम् तुदादिः",
    rom: "tṛnh (tṛnhūṁ) hiṃsāyām tudādiḥ"
  },
  'wqp4_wqpaz_curAxiH_wqpwO': {
    dev: "तृप् (तृपँ) तृप्तौ चुरादिः",
    rom: "tṛp (tṛpaṁ) tṛptau curādiḥ"
  },
  'wqp3_wqpaz_wuxAxiH_wqpwO': {
    dev: "तृप् (तृपँ) तृप्तौ तुदादिः",
    rom: "tṛp (tṛpaṁ) tṛptau tudādiḥ"
  },
  'wqp1_wqpaz_xivAxiH_prINane': {
    dev: "तृप् (तृपँ) प्रीणने दिवादिः",
    rom: "tṛp (tṛpaṁ) prīṇane divādiḥ"
  },
  'wqp2_wqpaz_svAxiH_prINane': {
    dev: "तृप् (तृपँ) प्रीणने स्वादिः",
    rom: "tṛp (tṛpaṁ) prīṇane svādiḥ"
  },
  'wqp1_wqpaz_xivAxiH_prIwO': {
    dev: "तृप् (तृपँ) प्रीतौ दिवादिः",
    rom: "tṛp (tṛpaṁ) prītau divādiḥ"
  },
  'wqp4_wqpaz_curAxiH_sanxIpane': {
    dev: "तृप् (तृपँ) सन्दीपने चुरादिः",
    rom: "tṛp (tṛpaṁ) sandīpane curādiḥ"
  },
  'wqP1_wqPaz_wuxAxiH_wqpwO': {
    dev: "तृफ् (तृफँ) तृप्तौ तुदादिः",
    rom: "tṛph (tṛphaṁ) tṛptau tudādiḥ"
  },
  'wqR1_FiwqRAz_xivAxiH_pipAsAyAm': {
    dev: "तृष् (ञितृषाँ) पिपासायाम् दिवादिः",
    rom: "tṛṣ (ñitṛṣāṁ) pipāsāyām divādiḥ"
  },
  'wqh1_wqhaz_BvAxiH_vqxXO': {
    dev: "तृह् (तृहँ) वृद्धौ भ्वादिः",
    rom: "tṛh (tṛhaṁ) vṛddhau bhvādiḥ"
  },
  'wqh4_wqhaz_ruXAxiH_hiMsAyAm': {
    dev: "तृह् (तृहँ) हिंसायाम् रुधादिः",
    rom: "tṛh (tṛhaṁ) hiṃsāyām rudhādiḥ"
  },
  'wqh2_wqhiz_BvAxiH_vqxXO': {
    dev: "तृह् (तृहिँ) वृद्धौ भ्वादिः",
    rom: "tṛh (tṛhiṁ) vṛddhau bhvādiḥ"
  },
  'wqh3_wqhUz_wuxAxiH_hiMsAyAm': {
    dev: "तृह् (तृहूँ) हिंसायाम् तुदादिः",
    rom: "tṛh (tṛhūṁ) hiṃsāyām tudādiḥ"
  },
  'wQ1_wQ_BvAxiH_waraNe': {
    dev: "तॄ (तॄ) तरणे भ्वादिः",
    rom: "tṝ (tṝ) taraṇe bhvādiḥ"
  },
  'wQ1_wQ_BvAxiH_plavane': {
    dev: "तॄ (तॄ) प्लवने भ्वादिः",
    rom: "tṝ (tṝ) plavane bhvādiḥ"
  },
  'wej1_wejaz_BvAxiH_pAlane': {
    dev: "तेज् (तेजँ) पालने भ्वादिः",
    rom: "tej (tejaṁ) pālane bhvādiḥ"
  },
  'wep1_wepqz_BvAxiH_kampane': {
    dev: "तेप् (तेपृँ) कम्पने भ्वादिः",
    rom: "tep (tepṛṁ) kampane bhvādiḥ"
  },
  'wep1_wepqz_BvAxiH_kRaraNe': {
    dev: "तेप् (तेपृँ) क्षरणे भ्वादिः",
    rom: "tep (tepṛṁ) kṣaraṇe bhvādiḥ"
  },
  'wev1_wevqz_BvAxiH_xevane': {
    dev: "तेव् (तेवृँ) देवने भ्वादिः",
    rom: "tev (tevṛṁ) devane bhvādiḥ"
  },
  'wyaj1_wyajaz_BvAxiH_hAnO': {
    dev: "त्यज् (त्यजँ) हानौ भ्वादिः",
    rom: "tyaj (tyajaṁ) hānau bhvādiḥ"
  },
  'wrak1_wrakiz_BvAxiH_gawO': {
    dev: "त्रक् (त्रकिँ) गतौ भ्वादिः",
    rom: "trak (trakiṁ) gatau bhvādiḥ"
  },
  'wrag1_wragiz_BvAxiH_gawO': {
    dev: "त्रग् (त्रगिँ) गतौ भ्वादिः",
    rom: "trag (tragiṁ) gatau bhvādiḥ"
  },
  'wrax1_wraxiz_BvAxiH_ceRtAyAm': {
    dev: "त्रद् (त्रदिँ) चेष्टायाम् भ्वादिः",
    rom: "trad (tradiṁ) ceṣṭāyām bhvādiḥ"
  },
  'wrap1_wrapUzR_BvAxiH_lajjAyAm': {
    dev: "त्रप् (त्रपूँष्) लज्जायाम् भ्वादिः",
    rom: "trap (trapūṁṣ) lajjāyām bhvādiḥ"
  },
  'wras2_wrasaz_curAxiH_XAraNe': {
    dev: "त्रस् (त्रसँ) धारणे चुरादिः",
    rom: "tras (trasaṁ) dhāraṇe curādiḥ"
  },
  'wras3_wrasiz_curAxiH_BARArWe': {
    dev: "त्रस् (त्रसिँ) भाषार्थे चुरादिः",
    rom: "tras (trasiṁ) bhāṣārthe curādiḥ"
  },
  'wras3_wrasiz_curAxiH_BAsArWe': {
    dev: "त्रस् (त्रसिँ) भासार्थे चुरादिः",
    rom: "tras (trasiṁ) bhāsārthe curādiḥ"
  },
  'wras1_wrasIz_xivAxiH_uxvege': {
    dev: "त्रस् (त्रसीँ) उद्वेगे दिवादिः",
    rom: "tras (trasīṁ) udvege divādiḥ"
  },
  'wrut2_wrutaz_curAxiH_Cexane': {
    dev: "त्रुट् (त्रुटँ) छेदने चुरादिः",
    rom: "truṭ (truṭaṁ) chedane curādiḥ"
  },
  'wrut1_wrutaz_wuxAxiH_Cexane': {
    dev: "त्रुट् (त्रुटँ) छेदने तुदादिः",
    rom: "truṭ (truṭaṁ) chedane tudādiḥ"
  },
  'wrunp1_wrunpaz_BvAxiH_hiMsAyAm': {
    dev: "त्रुन्प् (त्रुन्पँ) हिंसायाम् भ्वादिः",
    rom: "trunp (trunpaṁ) hiṃsāyām bhvādiḥ"
  },
  'wrunP1_wrunPaz_BvAxiH_hiMsAyAm': {
    dev: "त्रुन्फ् (त्रुन्फँ) हिंसायाम् भ्वादिः",
    rom: "trunph (trunphaṁ) hiṃsāyām bhvādiḥ"
  },
  'wrup1_wrupaz_BvAxiH_hiMsAyAm': {
    dev: "त्रुप् (त्रुपँ) हिंसायाम् भ्वादिः",
    rom: "trup (trupaṁ) hiṃsāyām bhvādiḥ"
  },
  'wruP1_wruPaz_BvAxiH_hiMsAyAm': {
    dev: "त्रुफ् (त्रुफँ) हिंसायाम् भ्वादिः",
    rom: "truph (truphaṁ) hiṃsāyām bhvādiḥ"
  },
  'wrE1_wrEf_BvAxiH_pAlane': {
    dev: "त्रै (त्रैङ्) पालने भ्वादिः",
    rom: "trai (traiṅ) pālane bhvādiḥ"
  },
  'wrOk1_wrOkqz_BvAxiH_gawO': {
    dev: "त्रौक् (त्रौकृँ) गतौ भ्वादिः",
    rom: "trauk (traukṛṁ) gatau bhvādiḥ"
  },
  'wvakR2_wvakRaz_BvAxiH_wvacane': {
    dev: "त्वक्ष् (त्वक्षँ) त्वचने भ्वादिः",
    rom: "tvakṣ (tvakṣaṁ) tvacane bhvādiḥ"
  },
  'wvakR1_wvakRUz_BvAxiH_wanUkaraNe': {
    dev: "त्वक्ष् (त्वक्षूँ) तनूकरणे भ्वादिः",
    rom: "tvakṣ (tvakṣūṁ) tanūkaraṇe bhvādiḥ"
  },
  'wvag1_wvagiz_BvAxiH_kampane': {
    dev: "त्वग् (त्वगिँ) कम्पने भ्वादिः",
    rom: "tvag (tvagiṁ) kampane bhvādiḥ"
  },
  'wvag1_wvagiz_BvAxiH_gawO': {
    dev: "त्वग् (त्वगिँ) गतौ भ्वादिः",
    rom: "tvag (tvagiṁ) gatau bhvādiḥ"
  },
  'wvac1_wvacaz_wuxAxiH_saMvaraNe': {
    dev: "त्वच् (त्वचँ) संवरणे तुदादिः",
    rom: "tvac (tvacaṁ) saṃvaraṇe tudādiḥ"
  },
  'wvanc1_wvancuz_BvAxiH_gawO': {
    dev: "त्वन्च् (त्वन्चुँ) गतौ भ्वादिः",
    rom: "tvanc (tvancuṁ) gatau bhvādiḥ"
  },
  'wvar1_FiwvarAz_BvAxiH_samBrame': {
    dev: "त्वर् (ञित्वराँ) सम्भ्रमे भ्वादिः",
    rom: "tvar (ñitvarāṁ) sambhrame bhvādiḥ"
  },
  'wviR1_wviRaz_BvAxiH_xIpwO': {
    dev: "त्विष् (त्विषँ) दीप्तौ भ्वादिः",
    rom: "tviṣ (tviṣaṁ) dīptau bhvādiḥ"
  },
  'wsar1_wsaraz_BvAxiH_CaxmagawO': {
    dev: "त्सर् (त्सरँ) छद्मगतौ भ्वादिः",
    rom: "tsar (tsaraṁ) chadmagatau bhvādiḥ"
  },
  'Wud1_Wudaz_wuxAxiH_saMvaraNe': {
    dev: "थुड् (थुडँ) संवरणे तुदादिः",
    rom: "thuḍ (thuḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'Wurv1_WurvIz_BvAxiH_hiMsAyAm': {
    dev: "थुर्व् (थुर्वीँ) हिंसायाम् भ्वादिः",
    rom: "thurv (thurvīṁ) hiṃsāyām bhvādiḥ"
  },
  'xakR1_xakRaz_BvAxiH_gawO': {
    dev: "दक्ष् (दक्षँ) गतौ भ्वादिः",
    rom: "dakṣ (dakṣaṁ) gatau bhvādiḥ"
  },
  'xakR1_xakRaz_BvAxiH_vqxXO': {
    dev: "दक्ष् (दक्षँ) वृद्धौ भ्वादिः",
    rom: "dakṣ (dakṣaṁ) vṛddhau bhvādiḥ"
  },
  'xakR1_xakRaz_BvAxiH_SAsane': {
    dev: "दक्ष् (दक्षँ) शासने भ्वादिः",
    rom: "dakṣ (dakṣaṁ) śāsane bhvādiḥ"
  },
  'xakR1_xakRaz_BvAxiH_SIGrArWe': {
    dev: "दक्ष् (दक्षँ) शीघ्रार्थे भ्वादिः",
    rom: "dakṣ (dakṣaṁ) śīghrārthe bhvādiḥ"
  },
  'xakR1_xakRaz_BvAxiH_hiMsAyAm': {
    dev: "दक्ष् (दक्षँ) हिंसायाम् भ्वादिः",
    rom: "dakṣ (dakṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'xaG2_xaGaz_svAxiH_GAwane': {
    dev: "दघ् (दघँ) घातने स्वादिः",
    rom: "dagh (daghaṁ) ghātane svādiḥ"
  },
  'xaG2_xaGaz_svAxiH_pAlane': {
    dev: "दघ् (दघँ) पालने स्वादिः",
    rom: "dagh (daghaṁ) pālane svādiḥ"
  },
  'xaG1_xaGiz_BvAxiH_pAlane': {
    dev: "दघ् (दघिँ) पालने भ्वादिः",
    rom: "dagh (daghiṁ) pālane bhvādiḥ"
  },
  'xaG1_xaGiz_BvAxiH_varjane': {
    dev: "दघ् (दघिँ) वर्जने भ्वादिः",
    rom: "dagh (daghiṁ) varjane bhvādiḥ"
  },
  'xaNda1_xaNda_curAxiH_xaNdanipAwane': {
    dev: "दण्ड (दण्ड) दण्डनिपातने चुरादिः",
    rom: "daṇḍa (daṇḍa) daṇḍanipātane curādiḥ"
  },
  'xax1_xaxaz_BvAxiH_xAne': {
    dev: "दद् (ददँ) दाने भ्वादिः",
    rom: "dad (dadaṁ) dāne bhvādiḥ"
  },
  'xaX1_xaXaz_BvAxiH_XAraNe': {
    dev: "दध् (दधँ) धारणे भ्वादिः",
    rom: "dadh (dadhaṁ) dhāraṇe bhvādiḥ"
  },
  'xanB1_xanBuz_svAxiH_xamBe': {
    dev: "दन्भ् (दन्भुँ) दम्भे स्वादिः",
    rom: "danbh (danbhuṁ) dambhe svādiḥ"
  },
  'xanS1_xanSaz_BvAxiH_xaMSane': {
    dev: "दन्श् (दन्शँ) दंशने भ्वादिः",
    rom: "danś (danśaṁ) daṃśane bhvādiḥ"
  },
  'xaB1_xaBaz_curAxiH_kRepe': {
    dev: "दभ् (दभँ) क्षेपे चुरादिः",
    rom: "dabh (dabhaṁ) kṣepe curādiḥ"
  },
  'xam1_xamuz_xivAxiH_upaSamane': {
    dev: "दम् (दमुँ) उपशमने दिवादिः",
    rom: "dam (damuṁ) upaśamane divādiḥ"
  },
  'xay1_xayaz_BvAxiH_AxAne': {
    dev: "दय् (दयँ) आदाने भ्वादिः",
    rom: "day (dayaṁ) ādāne bhvādiḥ"
  },
  'xay1_xayaz_BvAxiH_gawO': {
    dev: "दय् (दयँ) गतौ भ्वादिः",
    rom: "day (dayaṁ) gatau bhvādiḥ"
  },
  'xay1_xayaz_BvAxiH_xAne': {
    dev: "दय् (दयँ) दाने भ्वादिः",
    rom: "day (dayaṁ) dāne bhvādiḥ"
  },
  'xay1_xayaz_BvAxiH_rakRaNe': {
    dev: "दय् (दयँ) रक्षणे भ्वादिः",
    rom: "day (dayaṁ) rakṣaṇe bhvādiḥ"
  },
  'xay1_xayaz_BvAxiH_hiMsAyAm': {
    dev: "दय् (दयँ) हिंसायाम् भ्वादिः",
    rom: "day (dayaṁ) hiṃsāyām bhvādiḥ"
  },
  'xarixrA1_xarixrA_axAxiH_xurgawO': {
    dev: "दरिद्रा (दरिद्रा) दुर्गतौ अदादिः",
    rom: "daridrā (daridrā) durgatau adādiḥ"
  },
  'xal2_xalaz_curAxiH_vixAraNe': {
    dev: "दल् (दलँ) विदारणे चुरादिः",
    rom: "dal (dalaṁ) vidāraṇe curādiḥ"
  },
  'xal1_xalaz_BvAxiH_viSaraNe': {
    dev: "दल् (दलँ) विशरणे भ्वादिः",
    rom: "dal (dalaṁ) viśaraṇe bhvādiḥ"
  },
  'xav1_xaviz_BvAxiH_gawO': {
    dev: "दव् (दविँ) गतौ भ्वादिः",
    rom: "dav (daviṁ) gatau bhvādiḥ"
  },
  'xaS2_xaSiz_curAxiH_xaMSane': {
    dev: "दश् (दशिँ) दंशने चुरादिः",
    rom: "daś (daśiṁ) daṃśane curādiḥ"
  },
  'xaS1_xaSiz_curAxiH_BARArWe': {
    dev: "दश् (दशिँ) भाषार्थे चुरादिः",
    rom: "daś (daśiṁ) bhāṣārthe curādiḥ"
  },
  'xaS1_xaSiz_curAxiH_BAsArWe': {
    dev: "दश् (दशिँ) भासार्थे चुरादिः",
    rom: "daś (daśiṁ) bhāsārthe curādiḥ"
  },
  'xas3_xasiz_curAxiH_xaMSane': {
    dev: "दस् (दसिँ) दंशने चुरादिः",
    rom: "das (dasiṁ) daṃśane curādiḥ"
  },
  'xas3_xasiz_curAxiH_xarSane': {
    dev: "दस् (दसिँ) दर्शने चुरादिः",
    rom: "das (dasiṁ) darśane curādiḥ"
  },
  'xas2_xasiz_curAxiH_BARArWe': {
    dev: "दस् (दसिँ) भाषार्थे चुरादिः",
    rom: "das (dasiṁ) bhāṣārthe curādiḥ"
  },
  'xas2_xasiz_curAxiH_BAsArWe': {
    dev: "दस् (दसिँ) भासार्थे चुरादिः",
    rom: "das (dasiṁ) bhāsārthe curādiḥ"
  },
  'xas3_xasiz_curAxiH_hiMsAyAm': {
    dev: "दस् (दसिँ) हिंसायाम् चुरादिः",
    rom: "das (dasiṁ) hiṃsāyām curādiḥ"
  },
  'xas1_xasuz_xivAxiH_upakRaye': {
    dev: "दस् (दसुँ) उपक्षये दिवादिः",
    rom: "das (dasuṁ) upakṣaye divādiḥ"
  },
  'xas1_xasuz_xivAxiH_prakRepaNe': {
    dev: "दस् (दसुँ) प्रक्षेपणे दिवादिः",
    rom: "das (dasuṁ) prakṣepaṇe divādiḥ"
  },
  'xah1_xahaz_BvAxiH_BasmIkaraNe': {
    dev: "दह् (दहँ) भस्मीकरणे भ्वादिः",
    rom: "dah (dahaṁ) bhasmīkaraṇe bhvādiḥ"
  },
  'xah2_xahiz_curAxiH_rakRaNe': {
    dev: "दह् (दहिँ) रक्षणे चुरादिः",
    rom: "dah (dahiṁ) rakṣaṇe curādiḥ"
  },
  'xA3_duxAF_juhowyAxiH_xAne': {
    dev: "दा (डुदाञ्) दाने जुहोत्यादिः",
    rom: "dā (ḍudāñ) dāne juhotyādiḥ"
  },
  'xA1_xAN_BvAxiH_xAne': {
    dev: "दा (दाण्) दाने भ्वादिः",
    rom: "dā (dāṇ) dāne bhvādiḥ"
  },
  'xA2_xAp_axAxiH_lavane': {
    dev: "दा (दाप्) लवने अदादिः",
    rom: "dā (dāp) lavane adādiḥ"
  },
  'xAn1_xAnaz_BvAxiH_avaKaNdane': {
    dev: "दान् (दानँ) अवखण्डने भ्वादिः",
    rom: "dān (dānaṁ) avakhaṇḍane bhvādiḥ"
  },
  'xASa1_xASa_svAxiH_hiMsAyAm': {
    dev: "दाश (दाश) हिंसायाम् स्वादिः",
    rom: "dāśa (dāśa) hiṃsāyām svādiḥ"
  },
  'xAS2_xASqz_curAxiH_xAne': {
    dev: "दाश् (दाशृँ) दाने चुरादिः",
    rom: "dāś (dāśṛṁ) dāne curādiḥ"
  },
  'xAS1_xASqz_BvAxiH_xAne': {
    dev: "दाश् (दाशृँ) दाने भ्वादिः",
    rom: "dāś (dāśṛṁ) dāne bhvādiḥ"
  },
  'xAs1_xAsqz_BvAxiH_xAne': {
    dev: "दास् (दासृँ) दाने भ्वादिः",
    rom: "dās (dāsṛṁ) dāne bhvādiḥ"
  },
  'xiB1_xiBiz_curAxiH_kRepe': {
    dev: "दिभ् (दिभिँ) क्षेपे चुरादिः",
    rom: "dibh (dibhiṁ) kṣepe curādiḥ"
  },
  'xiv1_xiviz_BvAxiH_prINane': {
    dev: "दिव् (दिविँ) प्रीणने भ्वादिः",
    rom: "div (diviṁ) prīṇane bhvādiḥ"
  },
  'xiv3_xivuz_curAxiH_arxane': {
    dev: "दिव् (दिवुँ) अर्दने चुरादिः",
    rom: "div (divuṁ) ardane curādiḥ"
  },
  'xiv2_xivuz_xivAxiH_kAnwO': {
    dev: "दिव् (दिवुँ) कान्तौ दिवादिः",
    rom: "div (divuṁ) kāntau divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_krIdAyAm': {
    dev: "दिव् (दिवुँ) क्रीडायाम् दिवादिः",
    rom: "div (divuṁ) krīḍāyām divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_gawO': {
    dev: "दिव् (दिवुँ) गतौ दिवादिः",
    rom: "div (divuṁ) gatau divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_xyuwO': {
    dev: "दिव् (दिवुँ) द्युतौ दिवादिः",
    rom: "div (divuṁ) dyutau divādiḥ"
  },
  'xiv3_xivuz_curAxiH_parikUjane': {
    dev: "दिव् (दिवुँ) परिकूजने चुरादिः",
    rom: "div (divuṁ) parikūjane curādiḥ"
  },
  'xiv2_xivuz_xivAxiH_maxe': {
    dev: "दिव् (दिवुँ) मदे दिवादिः",
    rom: "div (divuṁ) made divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_moxane': {
    dev: "दिव् (दिवुँ) मोदने दिवादिः",
    rom: "div (divuṁ) modane divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_vijigIRAyAm': {
    dev: "दिव् (दिवुँ) विजिगीषायाम् दिवादिः",
    rom: "div (divuṁ) vijigīṣāyām divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_vyavahAre': {
    dev: "दिव् (दिवुँ) व्यवहारे दिवादिः",
    rom: "div (divuṁ) vyavahāre divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_swuwO': {
    dev: "दिव् (दिवुँ) स्तुतौ दिवादिः",
    rom: "div (divuṁ) stutau divādiḥ"
  },
  'xiv2_xivuz_xivAxiH_svapne': {
    dev: "दिव् (दिवुँ) स्वप्ने दिवादिः",
    rom: "div (divuṁ) svapne divādiḥ"
  },
  'xiS1_xiSaz_wuxAxiH_awisarjane': {
    dev: "दिश् (दिशँ) अतिसर्जने तुदादिः",
    rom: "diś (diśaṁ) atisarjane tudādiḥ"
  },
  'xih1_xihaz_axAxiH_upacaye': {
    dev: "दिह् (दिहँ) उपचये अदादिः",
    rom: "dih (dihaṁ) upacaye adādiḥ"
  },
  'xih1_xihaz_axAxiH_upawApe': {
    dev: "दिह् (दिहँ) उपतापे अदादिः",
    rom: "dih (dihaṁ) upatāpe adādiḥ"
  },
  'xI1_xIf_xivAxiH_kRaye': {
    dev: "दी (दीङ्) क्षये दिवादिः",
    rom: "dī (dīṅ) kṣaye divādiḥ"
  },
  'xIkR1_xIkRaz_BvAxiH_ijyAyAm': {
    dev: "दीक्ष् (दीक्षँ) इज्यायाम् भ्वादिः",
    rom: "dīkṣ (dīkṣaṁ) ijyāyām bhvādiḥ"
  },
  'xIkR1_xIkRaz_BvAxiH_upanayane': {
    dev: "दीक्ष् (दीक्षँ) उपनयने भ्वादिः",
    rom: "dīkṣ (dīkṣaṁ) upanayane bhvādiḥ"
  },
  'xIkR1_xIkRaz_BvAxiH_niyame': {
    dev: "दीक्ष् (दीक्षँ) नियमे भ्वादिः",
    rom: "dīkṣ (dīkṣaṁ) niyame bhvādiḥ"
  },
  'xIkR1_xIkRaz_BvAxiH_mONdye': {
    dev: "दीक्ष् (दीक्षँ) मौण्ड्ये भ्वादिः",
    rom: "dīkṣ (dīkṣaṁ) mauṇḍye bhvādiḥ"
  },
  'xIkR1_xIkRaz_BvAxiH_vrawAxeSe': {
    dev: "दीक्ष् (दीक्षँ) व्रतादेशे भ्वादिः",
    rom: "dīkṣ (dīkṣaṁ) vratādeśe bhvādiḥ"
  },
  'xIXI1_xIXIf_axAxiH_xIpwO': {
    dev: "दीधी (दीधीङ्) दीप्तौ अदादिः",
    rom: "dīdhī (dīdhīṅ) dīptau adādiḥ"
  },
  'xIXI1_xIXIf_axAxiH_xevane': {
    dev: "दीधी (दीधीङ्) देवने अदादिः",
    rom: "dīdhī (dīdhīṅ) devane adādiḥ"
  },
  'xIp1_xIpIz_xivAxiH_xIpwO': {
    dev: "दीप् (दीपीँ) दीप्तौ दिवादिः",
    rom: "dīp (dīpīṁ) dīptau divādiḥ"
  },
  'xu2_tuxu_svAxiH_upawApe': {
    dev: "दु (टुदु) उपतापे स्वादिः",
    rom: "du (ṭudu) upatāpe svādiḥ"
  },
  'xu1_xu_BvAxiH_gawO': {
    dev: "दु (दु) गतौ भ्वादिः",
    rom: "du (du) gatau bhvādiḥ"
  },
  'xuHKa1_xuHKa_curAxiH_wawkriyAyAm': {
    dev: "दुःख (दुःख) तत्क्रियायाम् चुरादिः",
    rom: "duḥkha (duḥkha) tatkriyāyām curādiḥ"
  },
  'xud1_xudaz_wuxAxiH_nimajjane': {
    dev: "दुड् (दुडँ) निमज्जने तुदादिः",
    rom: "duḍ (duḍaṁ) nimajjane tudādiḥ"
  },
  'xurv1_xurvIz_BvAxiH_hiMsAyAm': {
    dev: "दुर्व् (दुर्वीँ) हिंसायाम् भ्वादिः",
    rom: "durv (durvīṁ) hiṃsāyām bhvādiḥ"
  },
  'xul1_xulaz_curAxiH_uwkRepaNe': {
    dev: "दुल् (दुलँ) उत्क्षेपणे चुरादिः",
    rom: "dul (dulaṁ) utkṣepaṇe curādiḥ"
  },
  'xuR1_xuRaz_xivAxiH_vEkqwye': {
    dev: "दुष् (दुषँ) वैकृत्ये दिवादिः",
    rom: "duṣ (duṣaṁ) vaikṛtye divādiḥ"
  },
  'xuh2_xuhaz_axAxiH_prapUraNe': {
    dev: "दुह् (दुहँ) प्रपूरणे अदादिः",
    rom: "duh (duhaṁ) prapūraṇe adādiḥ"
  },
  'xuh1_xuhizr_BvAxiH_arxane': {
    dev: "दुह् (दुहिँर्) अर्दने भ्वादिः",
    rom: "duh (duhiṁr) ardane bhvādiḥ"
  },
  'xU1_xUf_xivAxiH_pariwApe': {
    dev: "दू (दूङ्) परितापे दिवादिः",
    rom: "dū (dūṅ) paritāpe divādiḥ"
  },
  'xq1_xq_BvAxiH_Baye': {
    dev: "दृ (दृ) भये भ्वादिः",
    rom: "dṛ (dṛ) bhaye bhvādiḥ"
  },
  'xq2_xq_svAxiH_hiMsAyAm': {
    dev: "दृ (दृ) हिंसायाम् स्वादिः",
    rom: "dṛ (dṛ) hiṃsāyām svādiḥ"
  },
  'xq3_xqf_wuxAxiH_Axare': {
    dev: "दृ (दृङ्) आदरे तुदादिः",
    rom: "dṛ (dṛṅ) ādare tudādiḥ"
  },
  'xqnP1_xqnPaz_wuxAxiH_uwkleSe': {
    dev: "दृन्फ् (दृन्फँ) उत्क्लेशे तुदादिः",
    rom: "dṛnph (dṛnphaṁ) utkleśe tudādiḥ"
  },
  'xqp1_xqpaz_xivAxiH_mocane': {
    dev: "दृप् (दृपँ) मोचने दिवादिः",
    rom: "dṛp (dṛpaṁ) mocane divādiḥ"
  },
  'xqp1_xqpaz_xivAxiH_mohane': {
    dev: "दृप् (दृपँ) मोहने दिवादिः",
    rom: "dṛp (dṛpaṁ) mohane divādiḥ"
  },
  'xqp2_xqpaz_curAxiH_sanxIpane': {
    dev: "दृप् (दृपँ) सन्दीपने चुरादिः",
    rom: "dṛp (dṛpaṁ) sandīpane curādiḥ"
  },
  'xqp1_xqpaz_xivAxiH_harRe': {
    dev: "दृप् (दृपँ) हर्षे दिवादिः",
    rom: "dṛp (dṛpaṁ) harṣe divādiḥ"
  },
  'xqP1_xqPaz_wuxAxiH_uwkleSe': {
    dev: "दृफ् (दृफँ) उत्क्लेशे तुदादिः",
    rom: "dṛph (dṛphaṁ) utkleśe tudādiḥ"
  },
  'xqB3_xqBaz_curAxiH_sanxarBe': {
    dev: "दृभ् (दृभँ) सन्दर्भे चुरादिः",
    rom: "dṛbh (dṛbhaṁ) sandarbhe curādiḥ"
  },
  'xqB1_xqBIz_wuxAxiH_granWe': {
    dev: "दृभ् (दृभीँ) ग्रन्थे तुदादिः",
    rom: "dṛbh (dṛbhīṁ) granthe tudādiḥ"
  },
  'xqB2_xqBIz_curAxiH_Baye': {
    dev: "दृभ् (दृभीँ) भये चुरादिः",
    rom: "dṛbh (dṛbhīṁ) bhaye curādiḥ"
  },
  'xqS1_xqSizr_BvAxiH_prekRaNe': {
    dev: "दृश् (दृशिँर्) प्रेक्षणे भ्वादिः",
    rom: "dṛś (dṛśiṁr) prekṣaṇe bhvādiḥ"
  },
  'xqh1_xqhaz_BvAxiH_vqxXO': {
    dev: "दृह् (दृहँ) वृद्धौ भ्वादिः",
    rom: "dṛh (dṛhaṁ) vṛddhau bhvādiḥ"
  },
  'xqh2_xqhiz_BvAxiH_vqxXO': {
    dev: "दृह् (दृहिँ) वृद्धौ भ्वादिः",
    rom: "dṛh (dṛhiṁ) vṛddhau bhvādiḥ"
  },
  'xQ1_xQ_BvAxiH_Baye': {
    dev: "दॄ (दॄ) भये भ्वादिः",
    rom: "dṝ (dṝ) bhaye bhvādiḥ"
  },
  'xQ2_xQ_kryAxiH_vixAraNe': {
    dev: "दॄ (दॄ) विदारणे क्र्यादिः",
    rom: "dṝ (dṝ) vidāraṇe kryādiḥ"
  },
  'xe1_xef_BvAxiH_rakRaNe': {
    dev: "दे (देङ्) रक्षणे भ्वादिः",
    rom: "de (deṅ) rakṣaṇe bhvādiḥ"
  },
  'xev1_xevqz_BvAxiH_xevane': {
    dev: "देव् (देवृँ) देवने भ्वादिः",
    rom: "dev (devṛṁ) devane bhvādiḥ"
  },
  'xE1_xEp_BvAxiH_SoXane': {
    dev: "दै (दैप्) शोधने भ्वादिः",
    rom: "dai (daip) śodhane bhvādiḥ"
  },
  'xo1_xo_xivAxiH_avaKaNdane': {
    dev: "दो (दो) अवखण्डने दिवादिः",
    rom: "do (do) avakhaṇḍane divādiḥ"
  },
  'xyu1_xyu_axAxiH_aBigamane': {
    dev: "द्यु (द्यु) अभिगमने अदादिः",
    rom: "dyu (dyu) abhigamane adādiḥ"
  },
  'xyuw1_xyuwaz_BvAxiH_xIpwO': {
    dev: "द्युत् (द्युतँ) दीप्तौ भ्वादिः",
    rom: "dyut (dyutaṁ) dīptau bhvādiḥ"
  },
  'xyE1_xyE_BvAxiH_nyafgaviXAne': {
    dev: "द्यै (द्यै) न्यङ्गविधाने भ्वादिः",
    rom: "dyai (dyai) nyaṅgavidhāne bhvādiḥ"
  },
  'xram1_xramaz_BvAxiH_gawO': {
    dev: "द्रम् (द्रमँ) गतौ भ्वादिः",
    rom: "dram (dramaṁ) gatau bhvādiḥ"
  },
  'xrA1_xrA_axAxiH_kuwsAyAM_gawO': {
    dev: "द्रा (द्रा) कुत्सायां_गतौ अदादिः",
    rom: "drā (drā) kutsāyāṃ_gatau adādiḥ"
  },
  'xrAkR1_xrAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "द्राक्ष् (द्राक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "drākṣ (drākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'xrAkR1_xrAkRiz_BvAxiH_GoravAsiwe': {
    dev: "द्राक्ष् (द्राक्षिँ) घोरवासिते भ्वादिः",
    rom: "drākṣ (drākṣiṁ) ghoravāsite bhvādiḥ"
  },
  'xrAK1_xrAKqz_BvAxiH_alamarWe': {
    dev: "द्राख् (द्राखृँ) अलमर्थे भ्वादिः",
    rom: "drākh (drākhṛṁ) alamarthe bhvādiḥ"
  },
  'xrAK1_xrAKqz_BvAxiH_SoRaNe': {
    dev: "द्राख् (द्राखृँ) शोषणे भ्वादिः",
    rom: "drākh (drākhṛṁ) śoṣaṇe bhvādiḥ"
  },
  'xrAG1_xrAGqz_BvAxiH_AyAme': {
    dev: "द्राघ् (द्राघृँ) आयामे भ्वादिः",
    rom: "drāgh (drāghṛṁ) āyāme bhvādiḥ"
  },
  'xrAG1_xrAGqz_BvAxiH_AyAse': {
    dev: "द्राघ् (द्राघृँ) आयासे भ्वादिः",
    rom: "drāgh (drāghṛṁ) āyāse bhvādiḥ"
  },
  'xrAG1_xrAGqz_BvAxiH_sAmarWye': {
    dev: "द्राघ् (द्राघृँ) सामर्थ्ये भ्वादिः",
    rom: "drāgh (drāghṛṁ) sāmarthye bhvādiḥ"
  },
  'xrAd1_xrAdqz_BvAxiH_viSaraNe': {
    dev: "द्राड् (द्राडृँ) विशरणे भ्वादिः",
    rom: "drāḍ (drāḍṛṁ) viśaraṇe bhvādiḥ"
  },
  'xrAh1_xrAhqz_BvAxiH_nikRepe': {
    dev: "द्राह् (द्राहृँ) निक्षेपे भ्वादिः",
    rom: "drāh (drāhṛṁ) nikṣepe bhvādiḥ"
  },
  'xrAh1_xrAhqz_BvAxiH_nixrAkRaye': {
    dev: "द्राह् (द्राहृँ) निद्राक्षये भ्वादिः",
    rom: "drāh (drāhṛṁ) nidrākṣaye bhvādiḥ"
  },
  'xru1_xru_BvAxiH_gawO': {
    dev: "द्रु (द्रु) गतौ भ्वादिः",
    rom: "dru (dru) gatau bhvādiḥ"
  },
  'xruN1_xruNaz_wuxAxiH_kOtilye': {
    dev: "द्रुण् (द्रुणँ) कौटिल्ये तुदादिः",
    rom: "druṇ (druṇaṁ) kauṭilye tudādiḥ"
  },
  'xruN1_xruNaz_wuxAxiH_gawO': {
    dev: "द्रुण् (द्रुणँ) गतौ तुदादिः",
    rom: "druṇ (druṇaṁ) gatau tudādiḥ"
  },
  'xruN1_xruNaz_wuxAxiH_hiMsAyAm': {
    dev: "द्रुण् (द्रुणँ) हिंसायाम् तुदादिः",
    rom: "druṇ (druṇaṁ) hiṃsāyām tudādiḥ"
  },
  'xruh1_xruhaz_xivAxiH_jiGAMsAyAm': {
    dev: "द्रुह् (द्रुहँ) जिघांसायाम् दिवादिः",
    rom: "druh (druhaṁ) jighāṃsāyām divādiḥ"
  },
  'xrU1_xrUF_kryAxiH_hiMsAyAm': {
    dev: "द्रू (द्रूञ्) हिंसायाम् क्र्यादिः",
    rom: "drū (drūñ) hiṃsāyām kryādiḥ"
  },
  'xrek1_xrekqz_BvAxiH_uwsAhe': {
    dev: "द्रेक् (द्रेकृँ) उत्साहे भ्वादिः",
    rom: "drek (drekṛṁ) utsāhe bhvādiḥ"
  },
  'xrek1_xrekqz_BvAxiH_Sabxe': {
    dev: "द्रेक् (द्रेकृँ) शब्दे भ्वादिः",
    rom: "drek (drekṛṁ) śabde bhvādiḥ"
  },
  'xrE1_xrE_BvAxiH_svapne': {
    dev: "द्रै (द्रै) स्वप्ने भ्वादिः",
    rom: "drai (drai) svapne bhvādiḥ"
  },
  'xviR1_xviRaz_axAxiH_aprIwO': {
    dev: "द्विष् (द्विषँ) अप्रीतौ अदादिः",
    rom: "dviṣ (dviṣaṁ) aprītau adādiḥ"
  },
  'xvq1_xvq_BvAxiH_anAxare': {
    dev: "द्वृ (द्वृ) अनादरे भ्वादिः",
    rom: "dvṛ (dvṛ) anādare bhvādiḥ"
  },
  'xvq1_xvq_BvAxiH_varaNe': {
    dev: "द्वृ (द्वृ) वरणे भ्वादिः",
    rom: "dvṛ (dvṛ) varaṇe bhvādiḥ"
  },
  'Xakk1_Xakkaz_curAxiH_nASane': {
    dev: "धक्क् (धक्कँ) नाशने चुरादिः",
    rom: "dhakk (dhakkaṁ) nāśane curādiḥ"
  },
  'XaN1_XaNaz_BvAxiH_Sabxe': {
    dev: "धण् (धणँ) शब्दे भ्वादिः",
    rom: "dhaṇ (dhaṇaṁ) śabde bhvādiḥ"
  },
  'Xan1_Xanaz_juhowyAxiH_XAnye': {
    dev: "धन् (धनँ) धान्ये जुहोत्यादिः",
    rom: "dhan (dhanaṁ) dhānye juhotyādiḥ"
  },
  'Xav1_Xaviz_BvAxiH_gawO': {
    dev: "धव् (धविँ) गतौ भ्वादिः",
    rom: "dhav (dhaviṁ) gatau bhvādiḥ"
  },
  'XA1_duXAF_juhowyAxiH_xAne': {
    dev: "धा (डुधाञ्) दाने जुहोत्यादिः",
    rom: "dhā (ḍudhāñ) dāne juhotyādiḥ"
  },
  'XA1_duXAF_juhowyAxiH_XAraNe': {
    dev: "धा (डुधाञ्) धारणे जुहोत्यादिः",
    rom: "dhā (ḍudhāñ) dhāraṇe juhotyādiḥ"
  },
  'XA1_duXAF_juhowyAxiH_poRaNe': {
    dev: "धा (डुधाञ्) पोषणे जुहोत्यादिः",
    rom: "dhā (ḍudhāñ) poṣaṇe juhotyādiḥ"
  },
  'saMsAXanI_iw_XAwu_gaNa_mng': {
    dev: "संसाधनी (इत्) गण_म्न्ग् धातु",
    rom: "saṃsādhanī (it) gaṇa_mng dhātu"
  },
  'XAv1_XAvuz_BvAxiH_gawO': {
    dev: "धाव् (धावुँ) गतौ भ्वादिः",
    rom: "dhāv (dhāvuṁ) gatau bhvādiḥ"
  },
  'XAv1_XAvuz_BvAxiH_SuxXO': {
    dev: "धाव् (धावुँ) शुद्धौ भ्वादिः",
    rom: "dhāv (dhāvuṁ) śuddhau bhvādiḥ"
  },
  'Xi1_Xi_wuxAxiH_XAraNe': {
    dev: "धि (धि) धारणे तुदादिः",
    rom: "dhi (dhi) dhāraṇe tudādiḥ"
  },
  'Xi1_Xi_wuxAxiH_viXAraNe': {
    dev: "धि (धि) विधारणे तुदादिः",
    rom: "dhi (dhi) vidhāraṇe tudādiḥ"
  },
  'XikR1_XikRaz_BvAxiH_kleSane': {
    dev: "धिक्ष् (धिक्षँ) क्लेशने भ्वादिः",
    rom: "dhikṣ (dhikṣaṁ) kleśane bhvādiḥ"
  },
  'XikR1_XikRaz_BvAxiH_jIvane': {
    dev: "धिक्ष् (धिक्षँ) जीवने भ्वादिः",
    rom: "dhikṣ (dhikṣaṁ) jīvane bhvādiḥ"
  },
  'XikR1_XikRaz_BvAxiH_sanxIpane': {
    dev: "धिक्ष् (धिक्षँ) सन्दीपने भ्वादिः",
    rom: "dhikṣ (dhikṣaṁ) sandīpane bhvādiḥ"
  },
  'Xiv1_Xiviz_BvAxiH_prINane': {
    dev: "धिव् (धिविँ) प्रीणने भ्वादिः",
    rom: "dhiv (dhiviṁ) prīṇane bhvādiḥ"
  },
  'XiR1_XiRaz_juhowyAxiH_Sabxe': {
    dev: "धिष् (धिषँ) शब्दे जुहोत्यादिः",
    rom: "dhiṣ (dhiṣaṁ) śabde juhotyādiḥ"
  },
  'XI1_XIf_xivAxiH_anAxare': {
    dev: "धी (धीङ्) अनादरे दिवादिः",
    rom: "dhī (dhīṅ) anādare divādiḥ"
  },
  'XI1_XIf_xivAxiH_AxAne': {
    dev: "धी (धीङ्) आदाने दिवादिः",
    rom: "dhī (dhīṅ) ādāne divādiḥ"
  },
  'XI1_XIf_xivAxiH_AXAre': {
    dev: "धी (धीङ्) आधारे दिवादिः",
    rom: "dhī (dhīṅ) ādhāre divādiḥ"
  },
  'Xu1_XuF_svAxiH_kampane': {
    dev: "धु (धुञ्) कम्पने स्वादिः",
    rom: "dhu (dhuñ) kampane svādiḥ"
  },
  'XukR1_XukRaz_BvAxiH_kleSane': {
    dev: "धुक्ष् (धुक्षँ) क्लेशने भ्वादिः",
    rom: "dhukṣ (dhukṣaṁ) kleśane bhvādiḥ"
  },
  'XukR1_XukRaz_BvAxiH_jIvane': {
    dev: "धुक्ष् (धुक्षँ) जीवने भ्वादिः",
    rom: "dhukṣ (dhukṣaṁ) jīvane bhvādiḥ"
  },
  'XukR1_XukRaz_BvAxiH_sanxIpane': {
    dev: "धुक्ष् (धुक्षँ) सन्दीपने भ्वादिः",
    rom: "dhukṣ (dhukṣaṁ) sandīpane bhvādiḥ"
  },
  'Xurv1_XurvIz_BvAxiH_hiMsAyAm': {
    dev: "धुर्व् (धुर्वीँ) हिंसायाम् भ्वादिः",
    rom: "dhurv (dhurvīṁ) hiṃsāyām bhvādiḥ"
  },
  'XU2_XU_wuxAxiH_viXUnane': {
    dev: "धू (धू) विधूनने तुदादिः",
    rom: "dhū (dhū) vidhūnane tudādiḥ"
  },
  'XU3_XUF_kryAxiH_kampane': {
    dev: "धू (धूञ्) कम्पने क्र्यादिः",
    rom: "dhū (dhūñ) kampane kryādiḥ"
  },
  'XU4_XUF_curAxiH_kampane': {
    dev: "धू (धूञ्) कम्पने चुरादिः",
    rom: "dhū (dhūñ) kampane curādiḥ"
  },
  'XU1_XUF_svAxiH_kampane': {
    dev: "धू (धूञ्) कम्पने स्वादिः",
    rom: "dhū (dhūñ) kampane svādiḥ"
  },
  'XUp2_XUpaz_curAxiH_BARArWe': {
    dev: "धूप् (धूपँ) भाषार्थे चुरादिः",
    rom: "dhūp (dhūpaṁ) bhāṣārthe curādiḥ"
  },
  'XUp2_XUpaz_curAxiH_BAsArWe': {
    dev: "धूप् (धूपँ) भासार्थे चुरादिः",
    rom: "dhūp (dhūpaṁ) bhāsārthe curādiḥ"
  },
  'XUp1_XUpaz_BvAxiH_sanwApe': {
    dev: "धूप् (धूपँ) सन्तापे भ्वादिः",
    rom: "dhūp (dhūpaṁ) santāpe bhvādiḥ"
  },
  'XUr1_XUrIz_xivAxiH_gawO': {
    dev: "धूर् (धूरीँ) गतौ दिवादिः",
    rom: "dhūr (dhūrīṁ) gatau divādiḥ"
  },
  'XUr1_XUrIz_xivAxiH_hiMsAyAm': {
    dev: "धूर् (धूरीँ) हिंसायाम् दिवादिः",
    rom: "dhūr (dhūrīṁ) hiṃsāyām divādiḥ"
  },
  'XUR1_XURaz_curAxiH_kAnwikaraNe': {
    dev: "धूष् (धूषँ) कान्तिकरणे चुरादिः",
    rom: "dhūṣ (dhūṣaṁ) kāntikaraṇe curādiḥ"
  },
  'XUs1_XUsaz_curAxiH_kAnwikaraNe': {
    dev: "धूस् (धूसँ) कान्तिकरणे चुरादिः",
    rom: "dhūs (dhūsaṁ) kāntikaraṇe curādiḥ"
  },
  'Xq2_Xqf_BvAxiH_avaXvaMsane': {
    dev: "धृ (धृङ्) अवध्वंसने भ्वादिः",
    rom: "dhṛ (dhṛṅ) avadhvaṃsane bhvādiḥ"
  },
  'Xq3_Xqf_wuxAxiH_avasWAne': {
    dev: "धृ (धृङ्) अवस्थाने तुदादिः",
    rom: "dhṛ (dhṛṅ) avasthāne tudādiḥ"
  },
  'Xq1_XqF_BvAxiH_XAraNe': {
    dev: "धृ (धृञ्) धारणे भ्वादिः",
    rom: "dhṛ (dhṛñ) dhāraṇe bhvādiḥ"
  },
  'Xqj1_Xqjaz_BvAxiH_gawO': {
    dev: "धृज् (धृजँ) गतौ भ्वादिः",
    rom: "dhṛj (dhṛjaṁ) gatau bhvādiḥ"
  },
  'Xqj2_Xqjiz_BvAxiH_gawO': {
    dev: "धृज् (धृजिँ) गतौ भ्वादिः",
    rom: "dhṛj (dhṛjiṁ) gatau bhvādiḥ"
  },
  'XqR1_FiXqRAz_svAxiH_prAgalBye': {
    dev: "धृष् (ञिधृषाँ) प्रागल्भ्ये स्वादिः",
    rom: "dhṛṣ (ñidhṛṣāṁ) prāgalbhye svādiḥ"
  },
  'XqR2_XqRaz_curAxiH_aprasahane': {
    dev: "धृष् (धृषँ) अप्रसहने चुरादिः",
    rom: "dhṛṣ (dhṛṣaṁ) aprasahane curādiḥ"
  },
  'XqR2_XqRaz_curAxiH_prasahane': {
    dev: "धृष् (धृषँ) प्रसहने चुरादिः",
    rom: "dhṛṣ (dhṛṣaṁ) prasahane curādiḥ"
  },
  'Xe1_Xet_BvAxiH_pAne': {
    dev: "धे (धेट्) पाने भ्वादिः",
    rom: "dhe (dheṭ) pāne bhvādiḥ"
  },
  'Xek1_Xekqz_BvAxiH_uwsAhe': {
    dev: "धेक् (धेकृँ) उत्साहे भ्वादिः",
    rom: "dhek (dhekṛṁ) utsāhe bhvādiḥ"
  },
  'Xek1_Xekqz_BvAxiH_Sabxe': {
    dev: "धेक् (धेकृँ) शब्दे भ्वादिः",
    rom: "dhek (dhekṛṁ) śabde bhvādiḥ"
  },
  'Xor1_Xorqz_BvAxiH_gawicAwurye': {
    dev: "धोर् (धोरृँ) गतिचातुर्ये भ्वादिः",
    rom: "dhor (dhorṛṁ) gaticāturye bhvādiḥ"
  },
  'XmA1_XmA_BvAxiH_agnisaMyoge': {
    dev: "ध्मा (ध्मा) अग्निसंयोगे भ्वादिः",
    rom: "dhmā (dhmā) agnisaṃyoge bhvādiḥ"
  },
  'XmA1_XmA_BvAxiH_Sabxe': {
    dev: "ध्मा (ध्मा) शब्दे भ्वादिः",
    rom: "dhmā (dhmā) śabde bhvādiḥ"
  },
  'XyE1_XyE_BvAxiH_cinwAyAm': {
    dev: "ध्यै (ध्यै) चिन्तायाम् भ्वादिः",
    rom: "dhyai (dhyai) cintāyām bhvādiḥ"
  },
  'Xraj1_Xrajaz_BvAxiH_gawO': {
    dev: "ध्रज् (ध्रजँ) गतौ भ्वादिः",
    rom: "dhraj (dhrajaṁ) gatau bhvādiḥ"
  },
  'Xraj2_Xrajiz_BvAxiH_gawO': {
    dev: "ध्रज् (ध्रजिँ) गतौ भ्वादिः",
    rom: "dhraj (dhrajiṁ) gatau bhvādiḥ"
  },
  'XraN1_XraNaz_BvAxiH_Sabxe': {
    dev: "ध्रण् (ध्रणँ) शब्दे भ्वादिः",
    rom: "dhraṇ (dhraṇaṁ) śabde bhvādiḥ"
  },
  'Xras1_uzXrasaz_kryAxiH_uFCe': {
    dev: "ध्रस् (उँध्रसँ) उञ्छे क्र्यादिः",
    rom: "dhras (uṁdhrasaṁ) uñche kryādiḥ"
  },
  'Xras2_uzXrasaz_curAxiH_uFCe': {
    dev: "ध्रस् (उँध्रसँ) उञ्छे चुरादिः",
    rom: "dhras (uṁdhrasaṁ) uñche curādiḥ"
  },
  'XrAkR1_XrAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "ध्राक्ष् (ध्राक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "dhrākṣ (dhrākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'XrAkR1_XrAkRiz_BvAxiH_GoravAsiwe': {
    dev: "ध्राक्ष् (ध्राक्षिँ) घोरवासिते भ्वादिः",
    rom: "dhrākṣ (dhrākṣiṁ) ghoravāsite bhvādiḥ"
  },
  'XrAK1_XrAKqz_BvAxiH_alamarWe': {
    dev: "ध्राख् (ध्राखृँ) अलमर्थे भ्वादिः",
    rom: "dhrākh (dhrākhṛṁ) alamarthe bhvādiḥ"
  },
  'XrAK1_XrAKqz_BvAxiH_SoRaNe': {
    dev: "ध्राख् (ध्राखृँ) शोषणे भ्वादिः",
    rom: "dhrākh (dhrākhṛṁ) śoṣaṇe bhvādiḥ"
  },
  'XrAG1_XrAGqz_BvAxiH_sAmarWye': {
    dev: "ध्राघ् (ध्राघृँ) सामर्थ्ये भ्वादिः",
    rom: "dhrāgh (dhrāghṛṁ) sāmarthye bhvādiḥ"
  },
  'XrAd1_XrAdqz_BvAxiH_viSaraNe': {
    dev: "ध्राड् (ध्राडृँ) विशरणे भ्वादिः",
    rom: "dhrāḍ (dhrāḍṛṁ) viśaraṇe bhvādiḥ"
  },
  'Xru2_Xru_wuxAxiH_gawO': {
    dev: "ध्रु (ध्रु) गतौ तुदादिः",
    rom: "dhru (dhru) gatau tudādiḥ"
  },
  'Xru2_Xru_wuxAxiH_sWErye': {
    dev: "ध्रु (ध्रु) स्थैर्ये तुदादिः",
    rom: "dhru (dhru) sthairye tudādiḥ"
  },
  'Xru1_Xru_BvAxiH_sWErye': {
    dev: "ध्रु (ध्रु) स्थैर्ये भ्वादिः",
    rom: "dhru (dhru) sthairye bhvādiḥ"
  },
  'Xrek1_Xrekqz_BvAxiH_uwsAhe': {
    dev: "ध्रेक् (ध्रेकृँ) उत्साहे भ्वादिः",
    rom: "dhrek (dhrekṛṁ) utsāhe bhvādiḥ"
  },
  'Xrek1_Xrekqz_BvAxiH_Sabxe': {
    dev: "ध्रेक् (ध्रेकृँ) शब्दे भ्वादिः",
    rom: "dhrek (dhrekṛṁ) śabde bhvādiḥ"
  },
  'XrE1_XrE_BvAxiH_wqpwO': {
    dev: "ध्रै (ध्रै) तृप्तौ भ्वादिः",
    rom: "dhrai (dhrai) tṛptau bhvādiḥ"
  },
  'Xvaj1_Xvajaz_BvAxiH_gawO': {
    dev: "ध्वज् (ध्वजँ) गतौ भ्वादिः",
    rom: "dhvaj (dhvajaṁ) gatau bhvādiḥ"
  },
  'Xvaj2_Xvajiz_BvAxiH_gawO': {
    dev: "ध्वज् (ध्वजिँ) गतौ भ्वादिः",
    rom: "dhvaj (dhvajiṁ) gatau bhvādiḥ"
  },
  'XvaN1_XvaNaz_BvAxiH_Sabxe': {
    dev: "ध्वण् (ध्वणँ) शब्दे भ्वादिः",
    rom: "dhvaṇ (dhvaṇaṁ) śabde bhvādiḥ"
  },
  'Xvana1_Xvana_curAxiH_Sabxe': {
    dev: "ध्वन (ध्वन) शब्दे चुरादिः",
    rom: "dhvana (dhvana) śabde curādiḥ"
  },
  'Xvan1_Xvanaz_BvAxiH_Sabxe': {
    dev: "ध्वन् (ध्वनँ) शब्दे भ्वादिः",
    rom: "dhvan (dhvanaṁ) śabde bhvādiḥ"
  },
  'Xvans1_Xvansuz_BvAxiH_aXaHpawane': {
    dev: "ध्वन्स् (ध्वन्सुँ) अधःपतने भ्वादिः",
    rom: "dhvans (dhvansuṁ) adhaḥpatane bhvādiḥ"
  },
  'Xvans1_Xvansuz_BvAxiH_avasraMsane': {
    dev: "ध्वन्स् (ध्वन्सुँ) अवस्रंसने भ्वादिः",
    rom: "dhvans (dhvansuṁ) avasraṃsane bhvādiḥ"
  },
  'Xvans1_Xvansuz_BvAxiH_gawO': {
    dev: "ध्वन्स् (ध्वन्सुँ) गतौ भ्वादिः",
    rom: "dhvans (dhvansuṁ) gatau bhvādiḥ"
  },
  'XvAkR1_XvAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "ध्वाक्ष् (ध्वाक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "dhvākṣ (dhvākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'XvAkR1_XvAkRiz_BvAxiH_GoravAsiwe': {
    dev: "ध्वाक्ष् (ध्वाक्षिँ) घोरवासिते भ्वादिः",
    rom: "dhvākṣ (dhvākṣiṁ) ghoravāsite bhvādiḥ"
  },
  'Xvq1_Xvq_BvAxiH_hUrcCane': {
    dev: "ध्वृ (ध्वृ) हूर्च्छने भ्वादिः",
    rom: "dhvṛ (dhvṛ) hūrcchane bhvādiḥ"
  },
  'nakk1_nakkaz_curAxiH_nASane': {
    dev: "नक्क् (नक्कँ) नाशने चुरादिः",
    rom: "nakk (nakkaṁ) nāśane curādiḥ"
  },
  'naK1_naKaz_BvAxiH_gawO': {
    dev: "नख् (नखँ) गतौ भ्वादिः",
    rom: "nakh (nakhaṁ) gatau bhvādiḥ"
  },
  'nat1_nataz_curAxiH_avasyanxane': {
    dev: "नट् (नटँ) अवस्यन्दने चुरादिः",
    rom: "naṭ (naṭaṁ) avasyandane curādiḥ"
  },
  'nat1_nataz_curAxiH_BARArWe': {
    dev: "नट् (नटँ) भाषार्थे चुरादिः",
    rom: "naṭ (naṭaṁ) bhāṣārthe curādiḥ"
  },
  'nax1_tunaxiz_BvAxiH_samqxXO': {
    dev: "नद् (टुनदिँ) समृद्धौ भ्वादिः",
    rom: "nad (ṭunadiṁ) samṛddhau bhvādiḥ"
  },
  'narx1_narxaz_BvAxiH_Sabxe': {
    dev: "नर्द् (नर्दँ) शब्दे भ्वादिः",
    rom: "nard (nardaṁ) śabde bhvādiḥ"
  },
  'narb1_narbaz_BvAxiH_gawO': {
    dev: "नर्ब् (नर्बँ) गतौ भ्वादिः",
    rom: "narb (narbaṁ) gatau bhvādiḥ"
  },
  'nAW1_nAWqz_BvAxiH_ASiRi': {
    dev: "नाथ् (नाथृँ) आशिषि भ्वादिः",
    rom: "nāth (nāthṛṁ) āśiṣi bhvādiḥ"
  },
  'nAW1_nAWqz_BvAxiH_upawApe': {
    dev: "नाथ् (नाथृँ) उपतापे भ्वादिः",
    rom: "nāth (nāthṛṁ) upatāpe bhvādiḥ"
  },
  'nAW1_nAWqz_BvAxiH_ESvarye': {
    dev: "नाथ् (नाथृँ) ऐश्वर्ये भ्वादिः",
    rom: "nāth (nāthṛṁ) aiśvarye bhvādiḥ"
  },
  'nAW1_nAWqz_BvAxiH_yAFcAyAm': {
    dev: "नाथ् (नाथृँ) याञ्चायाम् भ्वादिः",
    rom: "nāth (nāthṛṁ) yāñcāyām bhvādiḥ"
  },
  'nAX1_nAXqz_BvAxiH_ASiRi': {
    dev: "नाध् (नाधृँ) आशिषि भ्वादिः",
    rom: "nādh (nādhṛṁ) āśiṣi bhvādiḥ"
  },
  'nAX1_nAXqz_BvAxiH_upawApe': {
    dev: "नाध् (नाधृँ) उपतापे भ्वादिः",
    rom: "nādh (nādhṛṁ) upatāpe bhvādiḥ"
  },
  'nAX1_nAXqz_BvAxiH_ESvarye': {
    dev: "नाध् (नाधृँ) ऐश्वर्ये भ्वादिः",
    rom: "nādh (nādhṛṁ) aiśvarye bhvādiḥ"
  },
  'nAX1_nAXqz_BvAxiH_yAFcAyAm': {
    dev: "नाध् (नाधृँ) याञ्चायाम् भ्वादिः",
    rom: "nādh (nādhṛṁ) yāñcāyām bhvādiḥ"
  },
  'nivAsa1_nivAsa_curAxiH_AcCAxane': {
    dev: "निवास (निवास) आच्छादने चुरादिः",
    rom: "nivāsa (nivāsa) ācchādane curādiḥ"
  },
  'nq1_nq_BvAxiH_naye': {
    dev: "नृ (नृ) नये भ्वादिः",
    rom: "nṛ (nṛ) naye bhvādiḥ"
  },
  'nqw1_nqwIz_xivAxiH_gAwravikRepe': {
    dev: "नृत् (नृतीँ) गात्रविक्षेपे दिवादिः",
    rom: "nṛt (nṛtīṁ) gātravikṣepe divādiḥ"
  },
  'nQ2_nQ_kryAxiH_naye': {
    dev: "नॄ (नॄ) नये क्र्यादिः",
    rom: "nṝ (nṝ) naye kryādiḥ"
  },
  'nQ1_nQ_BvAxiH_naye': {
    dev: "नॄ (नॄ) नये भ्वादिः",
    rom: "nṝ (nṝ) naye bhvādiḥ"
  },
  'pakR2_pakRaz_curAxiH_parigrahe': {
    dev: "पक्ष् (पक्षँ) परिग्रहे चुरादिः",
    rom: "pakṣ (pakṣaṁ) parigrahe curādiḥ"
  },
  'pakR1_pakRaz_BvAxiH_parigrahe': {
    dev: "पक्ष् (पक्षँ) परिग्रहे भ्वादिः",
    rom: "pakṣ (pakṣaṁ) parigrahe bhvādiḥ"
  },
  'pac1_dupacazR_BvAxiH_pAke': {
    dev: "पच् (डुपचँष्) पाके भ्वादिः",
    rom: "pac (ḍupacaṁṣ) pāke bhvādiḥ"
  },
  'pac3_paciz_curAxiH_viswAre': {
    dev: "पच् (पचिँ) विस्तारे चुरादिः",
    rom: "pac (paciṁ) vistāre curādiḥ"
  },
  'pac2_paciz_BvAxiH_vyakwIkaraNe': {
    dev: "पच् (पचिँ) व्यक्तीकरणे भ्वादिः",
    rom: "pac (paciṁ) vyaktīkaraṇe bhvādiḥ"
  },
  'pata1_pata_curAxiH_granWe': {
    dev: "पट (पट) ग्रन्थे चुरादिः",
    rom: "paṭa (paṭa) granthe curādiḥ"
  },
  'pat1_pataz_BvAxiH_gawO': {
    dev: "पट् (पटँ) गतौ भ्वादिः",
    rom: "paṭ (paṭaṁ) gatau bhvādiḥ"
  },
  'pat2_pataz_curAxiH_BARArWe': {
    dev: "पट् (पटँ) भाषार्थे चुरादिः",
    rom: "paṭ (paṭaṁ) bhāṣārthe curādiḥ"
  },
  'pat2_pataz_curAxiH_BAsArWe': {
    dev: "पट् (पटँ) भासार्थे चुरादिः",
    rom: "paṭ (paṭaṁ) bhāsārthe curādiḥ"
  },
  'paT1_paTaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "पठ् (पठँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "paṭh (paṭhaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'pad1_padiz_BvAxiH_gawO': {
    dev: "पड् (पडिँ) गतौ भ्वादिः",
    rom: "paḍ (paḍiṁ) gatau bhvādiḥ"
  },
  'pad2_padiz_curAxiH_nASane': {
    dev: "पड् (पडिँ) नाशने चुरादिः",
    rom: "paḍ (paḍiṁ) nāśane curādiḥ"
  },
  'paN1_paNaz_BvAxiH_vyavahAre': {
    dev: "पण् (पणँ) व्यवहारे भ्वादिः",
    rom: "paṇ (paṇaṁ) vyavahāre bhvādiḥ"
  },
  'paN1_paNaz_BvAxiH_swuwO': {
    dev: "पण् (पणँ) स्तुतौ भ्वादिः",
    rom: "paṇ (paṇaṁ) stutau bhvādiḥ"
  },
  'pawa1_pawa_curAxiH_gawO': {
    dev: "पत (पत) गतौ चुरादिः",
    rom: "pata (pata) gatau curādiḥ"
  },
  'paw1_pawLz_BvAxiH_gawO': {
    dev: "पत् (पतॢँ) गतौ भ्वादिः",
    rom: "pat (patḷṁ) gatau bhvādiḥ"
  },
  'paW2_paWiz_curAxiH_gawO': {
    dev: "पथ् (पथिँ) गतौ चुरादिः",
    rom: "path (pathiṁ) gatau curādiḥ"
  },
  'paW1_paWez_BvAxiH_gawO': {
    dev: "पथ् (पथेँ) गतौ भ्वादिः",
    rom: "path (patheṁ) gatau bhvādiḥ"
  },
  'paxa1_paxa_curAxiH_gawO': {
    dev: "पद (पद) गतौ चुरादिः",
    rom: "pada (pada) gatau curādiḥ"
  },
  'pax1_paxaz_xivAxiH_gawO': {
    dev: "पद् (पदँ) गतौ दिवादिः",
    rom: "pad (padaṁ) gatau divādiḥ"
  },
  'pan1_panaz_BvAxiH_vyavahAre': {
    dev: "पन् (पनँ) व्यवहारे भ्वादिः",
    rom: "pan (panaṁ) vyavahāre bhvādiḥ"
  },
  'pan1_panaz_BvAxiH_swuwO': {
    dev: "पन् (पनँ) स्तुतौ भ्वादिः",
    rom: "pan (panaṁ) stutau bhvādiḥ"
  },
  'pay1_payaz_BvAxiH_gawO': {
    dev: "पय् (पयँ) गतौ भ्वादिः",
    rom: "pay (payaṁ) gatau bhvādiḥ"
  },
  'parNa1_parNa_curAxiH_hariwaBAve': {
    dev: "पर्ण (पर्ण) हरितभावे चुरादिः",
    rom: "parṇa (parṇa) haritabhāve curādiḥ"
  },
  'parW1_parWaz_curAxiH_prakRepaNe': {
    dev: "पर्थ् (पर्थँ) प्रक्षेपणे चुरादिः",
    rom: "parth (parthaṁ) prakṣepaṇe curādiḥ"
  },
  'parx1_parxaz_BvAxiH_kuwsiwe_Sabxe': {
    dev: "पर्द् (पर्दँ) कुत्सिते_शब्दे भ्वादिः",
    rom: "pard (pardaṁ) kutsite_śabde bhvādiḥ"
  },
  'parp1_parpaz_BvAxiH_gawO': {
    dev: "पर्प् (पर्पँ) गतौ भ्वादिः",
    rom: "parp (parpaṁ) gatau bhvādiḥ"
  },
  'parb1_parbaz_BvAxiH_gawO': {
    dev: "पर्ब् (पर्बँ) गतौ भ्वादिः",
    rom: "parb (parbaṁ) gatau bhvādiḥ"
  },
  'parv1_parvaz_BvAxiH_gawO': {
    dev: "पर्व् (पर्वँ) गतौ भ्वादिः",
    rom: "parv (parvaṁ) gatau bhvādiḥ"
  },
  'parv1_parvaz_BvAxiH_pUraNe': {
    dev: "पर्व् (पर्वँ) पूरणे भ्वादिः",
    rom: "parv (parvaṁ) pūraṇe bhvādiḥ"
  },
  'parv1_parvaz_BvAxiH_pUrwO': {
    dev: "पर्व् (पर्वँ) पूर्तौ भ्वादिः",
    rom: "parv (parvaṁ) pūrtau bhvādiḥ"
  },
  'parR1_parRaz_BvAxiH_snehane': {
    dev: "पर्ष् (पर्षँ) स्नेहने भ्वादिः",
    rom: "parṣ (parṣaṁ) snehane bhvādiḥ"
  },
  'pal1_palaz_BvAxiH_gawO': {
    dev: "पल् (पलँ) गतौ भ्वादिः",
    rom: "pal (palaṁ) gatau bhvādiḥ"
  },
  'pal2_palaz_curAxiH_rakRaNe': {
    dev: "पल् (पलँ) रक्षणे चुरादिः",
    rom: "pal (palaṁ) rakṣaṇe curādiḥ"
  },
  'palyUla1_palyUla_curAxiH_pavane': {
    dev: "पल्यूल (पल्यूल) पवने चुरादिः",
    rom: "palyūla (palyūla) pavane curādiḥ"
  },
  'palyUla1_palyUla_curAxiH_lavane': {
    dev: "पल्यूल (पल्यूल) लवने चुरादिः",
    rom: "palyūla (palyūla) lavane curādiḥ"
  },
  'paSa1_paSa_curAxiH_anupasarge': {
    dev: "पश (पश) अनुपसर्गे चुरादिः",
    rom: "paśa (paśa) anupasarge curādiḥ"
  },
  'paS1_paSaz_curAxiH_banXane': {
    dev: "पश् (पशँ) बन्धने चुरादिः",
    rom: "paś (paśaṁ) bandhane curādiḥ"
  },
  'paRa1_paRa_curAxiH_anupasarge': {
    dev: "पष (पष) अनुपसर्गे चुरादिः",
    rom: "paṣa (paṣa) anupasarge curādiḥ"
  },
  'pas1_pasiz_curAxiH_nASane': {
    dev: "पस् (पसिँ) नाशने चुरादिः",
    rom: "pas (pasiṁ) nāśane curādiḥ"
  },
  'pA1_pA_BvAxiH_pAne': {
    dev: "पा (पा) पाने भ्वादिः",
    rom: "pā (pā) pāne bhvādiḥ"
  },
  'pA2_pA_axAxiH_rakRaNe': {
    dev: "पा (पा) रक्षणे अदादिः",
    rom: "pā (pā) rakṣaṇe adādiḥ"
  },
  'pAra1_pAra_curAxiH_karmasamApwO': {
    dev: "पार (पार) कर्मसमाप्तौ चुरादिः",
    rom: "pāra (pāra) karmasamāptau curādiḥ"
  },
  'pAl1_pAlaz_curAxiH_rakRaNe': {
    dev: "पाल् (पालँ) रक्षणे चुरादिः",
    rom: "pāl (pālaṁ) rakṣaṇe curādiḥ"
  },
  'pi1_pi_wuxAxiH_gawO': {
    dev: "पि (पि) गतौ तुदादिः",
    rom: "pi (pi) gatau tudādiḥ"
  },
  'picc1_piccaz_curAxiH_kuttane': {
    dev: "पिच्च् (पिच्चँ) कुट्टने चुरादिः",
    rom: "picc (piccaṁ) kuṭṭane curādiḥ"
  },
  'piC1_piCaz_curAxiH_kuttane': {
    dev: "पिछ् (पिछँ) कुट्टने चुरादिः",
    rom: "pich (pichaṁ) kuṭṭane curādiḥ"
  },
  'pij2_pijiz_curAxiH_nikewane': {
    dev: "पिज् (पिजिँ) निकेतने चुरादिः",
    rom: "pij (pijiṁ) niketane curādiḥ"
  },
  'pij2_pijiz_curAxiH_balAxAne': {
    dev: "पिज् (पिजिँ) बलादाने चुरादिः",
    rom: "pij (pijiṁ) balādāne curādiḥ"
  },
  'pij2_pijiz_curAxiH_BARArWe': {
    dev: "पिज् (पिजिँ) भाषार्थे चुरादिः",
    rom: "pij (pijiṁ) bhāṣārthe curādiḥ"
  },
  'pij2_pijiz_curAxiH_BAsArWe': {
    dev: "पिज् (पिजिँ) भासार्थे चुरादिः",
    rom: "pij (pijiṁ) bhāsārthe curādiḥ"
  },
  'pij1_pijiz_axAxiH_varNe': {
    dev: "पिज् (पिजिँ) वर्णे अदादिः",
    rom: "pij (pijiṁ) varṇe adādiḥ"
  },
  'pij2_pijiz_curAxiH_hiMsAyAm': {
    dev: "पिज् (पिजिँ) हिंसायाम् चुरादिः",
    rom: "pij (pijiṁ) hiṃsāyām curādiḥ"
  },
  'pit1_pitaz_BvAxiH_Sabxe': {
    dev: "पिट् (पिटँ) शब्दे भ्वादिः",
    rom: "piṭ (piṭaṁ) śabde bhvādiḥ"
  },
  'pit1_pitaz_BvAxiH_safGAwe': {
    dev: "पिट् (पिटँ) सङ्घाते भ्वादिः",
    rom: "piṭ (piṭaṁ) saṅghāte bhvādiḥ"
  },
  'piT1_piTaz_BvAxiH_safkleSane': {
    dev: "पिठ् (पिठँ) सङ्क्लेशने भ्वादिः",
    rom: "piṭh (piṭhaṁ) saṅkleśane bhvādiḥ"
  },
  'piT1_piTaz_BvAxiH_hiMsAyAm': {
    dev: "पिठ् (पिठँ) हिंसायाम् भ्वादिः",
    rom: "piṭh (piṭhaṁ) hiṃsāyām bhvādiḥ"
  },
  'pid2_pidiz_curAxiH_safGAwe': {
    dev: "पिड् (पिडिँ) सङ्घाते चुरादिः",
    rom: "piḍ (piḍiṁ) saṅghāte curādiḥ"
  },
  'pid1_pidiz_BvAxiH_safGAwe': {
    dev: "पिड् (पिडिँ) सङ्घाते भ्वादिः",
    rom: "piḍ (piḍiṁ) saṅghāte bhvādiḥ"
  },
  'pil1_pilaz_curAxiH_kRepe': {
    dev: "पिल् (पिलँ) क्षेपे चुरादिः",
    rom: "pil (pilaṁ) kṣepe curādiḥ"
  },
  'piv1_piviz_BvAxiH_secane': {
    dev: "पिव् (पिविँ) सेचने भ्वादिः",
    rom: "piv (piviṁ) secane bhvādiḥ"
  },
  'piv1_piviz_BvAxiH_sevane': {
    dev: "पिव् (पिविँ) सेवने भ्वादिः",
    rom: "piv (piviṁ) sevane bhvādiḥ"
  },
  'piv1_piviz_BvAxiH_sraMsane': {
    dev: "पिव् (पिविँ) स्रंसने भ्वादिः",
    rom: "piv (piviṁ) sraṃsane bhvādiḥ"
  },
  'piS1_piSaz_wuxAxiH_avayave': {
    dev: "पिश् (पिशँ) अवयवे तुदादिः",
    rom: "piś (piśaṁ) avayave tudādiḥ"
  },
  'piR1_piRLz_ruXAxiH_saFcUrNane': {
    dev: "पिष् (पिषॢँ) सञ्चूर्णने रुधादिः",
    rom: "piṣ (piṣḷṁ) sañcūrṇane rudhādiḥ"
  },
  'pis2_pisaz_curAxiH_gawO': {
    dev: "पिस् (पिसँ) गतौ चुरादिः",
    rom: "pis (pisaṁ) gatau curādiḥ"
  },
  'pis3_pisiz_curAxiH_BARArWe': {
    dev: "पिस् (पिसिँ) भाषार्थे चुरादिः",
    rom: "pis (pisiṁ) bhāṣārthe curādiḥ"
  },
  'pis1_pisqz_BvAxiH_gawO': {
    dev: "पिस् (पिसृँ) गतौ भ्वादिः",
    rom: "pis (pisṛṁ) gatau bhvādiḥ"
  },
  'pI1_pIf_xivAxiH_pAne': {
    dev: "पी (पीङ्) पाने दिवादिः",
    rom: "pī (pīṅ) pāne divādiḥ"
  },
  'pId1_pIdaz_curAxiH_avagAhane': {
    dev: "पीड् (पीडँ) अवगाहने चुरादिः",
    rom: "pīḍ (pīḍaṁ) avagāhane curādiḥ"
  },
  'pId1_pIdaz_curAxiH_gahane': {
    dev: "पीड् (पीडँ) गहने चुरादिः",
    rom: "pīḍ (pīḍaṁ) gahane curādiḥ"
  },
  'pIl1_pIlaz_BvAxiH_prawiRtamBe': {
    dev: "पील् (पीलँ) प्रतिष्टम्भे भ्वादिः",
    rom: "pīl (pīlaṁ) pratiṣṭambhe bhvādiḥ"
  },
  'pIv1_pIvaz_BvAxiH_sWOlye': {
    dev: "पीव् (पीवँ) स्थौल्ये भ्वादिः",
    rom: "pīv (pīvaṁ) sthaulye bhvādiḥ"
  },
  'puMs1_puMsaz_curAxiH_aBimarxane': {
    dev: "पुंस् (पुंसँ) अभिमर्दने चुरादिः",
    rom: "puṃs (puṃsaṁ) abhimardane curādiḥ"
  },
  'puMs1_puMsaz_curAxiH_aBivarXane': {
    dev: "पुंस् (पुंसँ) अभिवर्धने चुरादिः",
    rom: "puṃs (puṃsaṁ) abhivardhane curādiḥ"
  },
  'puta1_puta_curAxiH_saMsarge': {
    dev: "पुट (पुट) संसर्गे चुरादिः",
    rom: "puṭa (puṭa) saṃsarge curādiḥ"
  },
  'put2_putaz_curAxiH_BARArWe': {
    dev: "पुट् (पुटँ) भाषार्थे चुरादिः",
    rom: "puṭ (puṭaṁ) bhāṣārthe curādiḥ"
  },
  'put2_putaz_curAxiH_BAsArWe': {
    dev: "पुट् (पुटँ) भासार्थे चुरादिः",
    rom: "puṭ (puṭaṁ) bhāsārthe curādiḥ"
  },
  'put1_putaz_wuxAxiH_saMSleRaNe': {
    dev: "पुट् (पुटँ) संश्लेषणे तुदादिः",
    rom: "puṭ (puṭaṁ) saṃśleṣaṇe tudādiḥ"
  },
  'put2_putaz_curAxiH_saFcUrNane': {
    dev: "पुट् (पुटँ) सञ्चूर्णने चुरादिः",
    rom: "puṭ (puṭaṁ) sañcūrṇane curādiḥ"
  },
  'put3_putiz_curAxiH_BARArWe': {
    dev: "पुट् (पुटिँ) भाषार्थे चुरादिः",
    rom: "puṭ (puṭiṁ) bhāṣārthe curādiḥ"
  },
  'pud2_pudaz_wuxAxiH_uwsarge': {
    dev: "पुड् (पुडँ) उत्सर्गे तुदादिः",
    rom: "puḍ (puḍaṁ) utsarge tudādiḥ"
  },
  'pud1_pudiz_BvAxiH_KaNdane': {
    dev: "पुड् (पुडिँ) खण्डने भ्वादिः",
    rom: "puḍ (puḍiṁ) khaṇḍane bhvādiḥ"
  },
  'puN1_puNaz_wuxAxiH_karmaNi_SuBe': {
    dev: "पुण् (पुणँ) कर्मणि_शुभे तुदादिः",
    rom: "puṇ (puṇaṁ) karmaṇi_śubhe tudādiḥ"
  },
  'puN1_puNaz_wuxAxiH_kOtilye': {
    dev: "पुण् (पुणँ) कौटिल्ये तुदादिः",
    rom: "puṇ (puṇaṁ) kauṭilye tudādiḥ"
  },
  'puwt1_puwtaz_curAxiH_alpIBAve': {
    dev: "पुत्ट् (पुत्टँ) अल्पीभावे चुरादिः",
    rom: "putṭ (putṭaṁ) alpībhāve curādiḥ"
  },
  'puW4_puWaz_curAxiH_BARArWe': {
    dev: "पुथ् (पुथँ) भाषार्थे चुरादिः",
    rom: "puth (puthaṁ) bhāṣārthe curādiḥ"
  },
  'puW4_puWaz_curAxiH_BAsArWe': {
    dev: "पुथ् (पुथँ) भासार्थे चुरादिः",
    rom: "puth (puthaṁ) bhāsārthe curādiḥ"
  },
  'puW3_puWaz_xivAxiH_hiMsAyAm': {
    dev: "पुथ् (पुथँ) हिंसायाम् दिवादिः",
    rom: "puth (puthaṁ) hiṃsāyām divādiḥ"
  },
  'puW2_puWiz_BvAxiH_safkleSane': {
    dev: "पुथ् (पुथिँ) सङ्क्लेशने भ्वादिः",
    rom: "puth (puthiṁ) saṅkleśane bhvādiḥ"
  },
  'puW2_puWiz_BvAxiH_hiMsAyAm': {
    dev: "पुथ् (पुथिँ) हिंसायाम् भ्वादिः",
    rom: "puth (puthiṁ) hiṃsāyām bhvādiḥ"
  },
  'puW1_puWez_BvAxiH_gawO': {
    dev: "पुथ् (पुथेँ) गतौ भ्वादिः",
    rom: "puth (putheṁ) gatau bhvādiḥ"
  },
  'pur1_puraz_wuxAxiH_agragamane': {
    dev: "पुर् (पुरँ) अग्रगमने तुदादिः",
    rom: "pur (puraṁ) agragamane tudādiḥ"
  },
  'purv1_purvaz_BvAxiH_pUrwO': {
    dev: "पुर्व् (पुर्वँ) पूर्तौ भ्वादिः",
    rom: "purv (purvaṁ) pūrtau bhvādiḥ"
  },
  'pul2_pulaz_curAxiH_mahawve': {
    dev: "पुल् (पुलँ) महत्वे चुरादिः",
    rom: "pul (pulaṁ) mahatve curādiḥ"
  },
  'pul1_pulaz_BvAxiH_mahawve': {
    dev: "पुल् (पुलँ) महत्वे भ्वादिः",
    rom: "pul (pulaṁ) mahatve bhvādiḥ"
  },
  'pul2_pulaz_curAxiH_samucCrAye': {
    dev: "पुल् (पुलँ) समुच्छ्राये चुरादिः",
    rom: "pul (pulaṁ) samucchrāye curādiḥ"
  },
  'puR4_puRaz_curAxiH_XAraNe': {
    dev: "पुष् (पुषँ) धारणे चुरादिः",
    rom: "puṣ (puṣaṁ) dhāraṇe curādiḥ"
  },
  'puR3_puRaz_kryAxiH_puRtO': {
    dev: "पुष् (पुषँ) पुष्टौ क्र्यादिः",
    rom: "puṣ (puṣaṁ) puṣṭau kryādiḥ"
  },
  'puR2_puRaz_xivAxiH_puRtO': {
    dev: "पुष् (पुषँ) पुष्टौ दिवादिः",
    rom: "puṣ (puṣaṁ) puṣṭau divādiḥ"
  },
  'puR1_puRaz_BvAxiH_puRtO': {
    dev: "पुष् (पुषँ) पुष्टौ भ्वादिः",
    rom: "puṣ (puṣaṁ) puṣṭau bhvādiḥ"
  },
  'puRp1_puRpaz_xivAxiH_vikasane': {
    dev: "पुष्प् (पुष्पँ) विकसने दिवादिः",
    rom: "puṣp (puṣpaṁ) vikasane divādiḥ"
  },
  'pusw1_puswaz_curAxiH_anAxare': {
    dev: "पुस्त् (पुस्तँ) अनादरे चुरादिः",
    rom: "pust (pustaṁ) anādare curādiḥ"
  },
  'pusw1_puswaz_curAxiH_Axare': {
    dev: "पुस्त् (पुस्तँ) आदरे चुरादिः",
    rom: "pust (pustaṁ) ādare curādiḥ"
  },
  'pusw1_puswaz_curAxiH_safGAwe': {
    dev: "पुस्त् (पुस्तँ) सङ्घाते चुरादिः",
    rom: "pust (pustaṁ) saṅghāte curādiḥ"
  },
  'pU1_pUf_BvAxiH_pavane': {
    dev: "पू (पूङ्) पवने भ्वादिः",
    rom: "pū (pūṅ) pavane bhvādiḥ"
  },
  'pU2_pUF_kryAxiH_pavane': {
    dev: "पू (पूञ्) पवने क्र्यादिः",
    rom: "pū (pūñ) pavane kryādiḥ"
  },
  'pUj1_pUjaz_curAxiH_pUjAyAm': {
    dev: "पूज् (पूजँ) पूजायाम् चुरादिः",
    rom: "pūj (pūjaṁ) pūjāyām curādiḥ"
  },
  'pUy1_pUyIz_BvAxiH_xurganXe': {
    dev: "पूय् (पूयीँ) दुर्गन्धे भ्वादिः",
    rom: "pūy (pūyīṁ) durgandhe bhvādiḥ"
  },
  'pUy1_pUyIz_BvAxiH_viSaraNe': {
    dev: "पूय् (पूयीँ) विशरणे भ्वादिः",
    rom: "pūy (pūyīṁ) viśaraṇe bhvādiḥ"
  },
  'pUr2_pUrIz_curAxiH_ApyAyane': {
    dev: "पूर् (पूरीँ) आप्यायने चुरादिः",
    rom: "pūr (pūrīṁ) āpyāyane curādiḥ"
  },
  'pUr1_pUrIz_xivAxiH_ApyAyane': {
    dev: "पूर् (पूरीँ) आप्यायने दिवादिः",
    rom: "pūr (pūrīṁ) āpyāyane divādiḥ"
  },
  'pUrv2_pUrvaz_curAxiH_nikewane': {
    dev: "पूर्व् (पूर्वँ) निकेतने चुरादिः",
    rom: "pūrv (pūrvaṁ) niketane curādiḥ"
  },
  'pUrv1_pUrvaz_BvAxiH_pUraNe': {
    dev: "पूर्व् (पूर्वँ) पूरणे भ्वादिः",
    rom: "pūrv (pūrvaṁ) pūraṇe bhvādiḥ"
  },
  'pUl2_pUlaz_curAxiH_safGAwe': {
    dev: "पूल् (पूलँ) सङ्घाते चुरादिः",
    rom: "pūl (pūlaṁ) saṅghāte curādiḥ"
  },
  'pUl1_pUlaz_BvAxiH_safGAwe': {
    dev: "पूल् (पूलँ) सङ्घाते भ्वादिः",
    rom: "pūl (pūlaṁ) saṅghāte bhvādiḥ"
  },
  'pUR1_pURaz_BvAxiH_vqxXO': {
    dev: "पूष् (पूषँ) वृद्धौ भ्वादिः",
    rom: "pūṣ (pūṣaṁ) vṛddhau bhvādiḥ"
  },
  'pq2_pq_svAxiH_prIwO': {
    dev: "पृ (पृ) प्रीतौ स्वादिः",
    rom: "pṛ (pṛ) prītau svādiḥ"
  },
  'pq3_pqf_wuxAxiH_vyAyAme': {
    dev: "पृ (पृङ्) व्यायामे तुदादिः",
    rom: "pṛ (pṛṅ) vyāyāme tudādiḥ"
  },
  'pqc3_pqcaz_curAxiH_saMyamane': {
    dev: "पृच् (पृचँ) संयमने चुरादिः",
    rom: "pṛc (pṛcaṁ) saṃyamane curādiḥ"
  },
  'pqc1_pqcIz_axAxiH_samparke': {
    dev: "पृच् (पृचीँ) सम्पर्के अदादिः",
    rom: "pṛc (pṛcīṁ) samparke adādiḥ"
  },
  'pqc2_pqcIz_ruXAxiH_samparke': {
    dev: "पृच् (पृचीँ) सम्पर्के रुधादिः",
    rom: "pṛc (pṛcīṁ) samparke rudhādiḥ"
  },
  'pqc1_pqcIz_axAxiH_samparcane': {
    dev: "पृच् (पृचीँ) सम्पर्चने अदादिः",
    rom: "pṛc (pṛcīṁ) samparcane adādiḥ"
  },
  'pqc4_pqcIz_curAxiH_samparcane': {
    dev: "पृच् (पृचीँ) सम्पर्चने चुरादिः",
    rom: "pṛc (pṛcīṁ) samparcane curādiḥ"
  },
  'pqj1_pqjIz_axAxiH_samparke': {
    dev: "पृज् (पृजीँ) सम्पर्के अदादिः",
    rom: "pṛj (pṛjīṁ) samparke adādiḥ"
  },
  'pqd1_pqdaz_wuxAxiH_suKe': {
    dev: "पृड् (पृडँ) सुखे तुदादिः",
    rom: "pṛḍ (pṛḍaṁ) sukhe tudādiḥ"
  },
  'pqN1_pqNaz_wuxAxiH_prINane': {
    dev: "पृण् (पृणँ) प्रीणने तुदादिः",
    rom: "pṛṇ (pṛṇaṁ) prīṇane tudādiḥ"
  },
  'pqW2_pqWaz_curAxiH_prakRepaNe': {
    dev: "पृथ् (पृथँ) प्रक्षेपणे चुरादिः",
    rom: "pṛth (pṛthaṁ) prakṣepaṇe curādiḥ"
  },
  'pqW1_pqWuz_BvAxiH_viswAre': {
    dev: "पृथ् (पृथुँ) विस्तारे भ्वादिः",
    rom: "pṛth (pṛthuṁ) vistāre bhvādiḥ"
  },
  'pqR1_pqRuz_BvAxiH_secane': {
    dev: "पृष् (पृषुँ) सेचने भ्वादिः",
    rom: "pṛṣ (pṛṣuṁ) secane bhvādiḥ"
  },
  'pQ2_pQ_kryAxiH_pAlane': {
    dev: "पॄ (पॄ) पालने क्र्यादिः",
    rom: "pṝ (pṝ) pālane kryādiḥ"
  },
  'pQ1_pQ_juhowyAxiH_pAlane': {
    dev: "पॄ (पॄ) पालने जुहोत्यादिः",
    rom: "pṝ (pṝ) pālane juhotyādiḥ"
  },
  'pQ2_pQ_kryAxiH_pUraNe': {
    dev: "पॄ (पॄ) पूरणे क्र्यादिः",
    rom: "pṝ (pṝ) pūraṇe kryādiḥ"
  },
  'pQ3_pQ_curAxiH_pUraNe': {
    dev: "पॄ (पॄ) पूरणे चुरादिः",
    rom: "pṝ (pṝ) pūraṇe curādiḥ"
  },
  'pQ1_pQ_juhowyAxiH_pUraNe': {
    dev: "पॄ (पॄ) पूरणे जुहोत्यादिः",
    rom: "pṝ (pṝ) pūraṇe juhotyādiḥ"
  },
  'peb1_pebqz_BvAxiH_sevane': {
    dev: "पेब् (पेबृँ) सेवने भ्वादिः",
    rom: "peb (pebṛṁ) sevane bhvādiḥ"
  },
  'pel1_pelqz_BvAxiH_gawO': {
    dev: "पेल् (पेलृँ) गतौ भ्वादिः",
    rom: "pel (pelṛṁ) gatau bhvādiḥ"
  },
  'pev1_pevqz_BvAxiH_secane': {
    dev: "पेव् (पेवृँ) सेचने भ्वादिः",
    rom: "pev (pevṛṁ) secane bhvādiḥ"
  },
  'pev1_pevqz_BvAxiH_sevane': {
    dev: "पेव् (पेवृँ) सेवने भ्वादिः",
    rom: "pev (pevṛṁ) sevane bhvādiḥ"
  },
  'pes1_pesqz_BvAxiH_gawO': {
    dev: "पेस् (पेसृँ) गतौ भ्वादिः",
    rom: "pes (pesṛṁ) gatau bhvādiḥ"
  },
  'pE1_pE_BvAxiH_SoRaNe': {
    dev: "पै (पै) शोषणे भ्वादिः",
    rom: "pai (pai) śoṣaṇe bhvādiḥ"
  },
  'pEN1_pENqz_BvAxiH_gawO': {
    dev: "पैण् (पैणृँ) गतौ भ्वादिः",
    rom: "paiṇ (paiṇṛṁ) gatau bhvādiḥ"
  },
  'pEN1_pENqz_BvAxiH_preraNe': {
    dev: "पैण् (पैणृँ) प्रेरणे भ्वादिः",
    rom: "paiṇ (paiṇṛṁ) preraṇe bhvādiḥ"
  },
  'pEN1_pENqz_BvAxiH_SleRaNe': {
    dev: "पैण् (पैणृँ) श्लेषणे भ्वादिः",
    rom: "paiṇ (paiṇṛṁ) śleṣaṇe bhvādiḥ"
  },
  'pyAy1_ozpyAyIz_BvAxiH_vqxXO': {
    dev: "प्याय् (ओँप्यायीँ) वृद्धौ भ्वादिः",
    rom: "pyāy (oṁpyāyīṁ) vṛddhau bhvādiḥ"
  },
  'pyus1_pyusaz_xivAxiH_viBAge': {
    dev: "प्युस् (प्युसँ) विभागे दिवादिः",
    rom: "pyus (pyusaṁ) vibhāge divādiḥ"
  },
  'pyE1_pyEf_BvAxiH_vqxXO': {
    dev: "प्यै (प्यैङ्) वृद्धौ भ्वादिः",
    rom: "pyai (pyaiṅ) vṛddhau bhvādiḥ"
  },
  'praC1_praCaz_wuxAxiH_jFIpsAyAm': {
    dev: "प्रछ् (प्रछँ) ज्ञीप्सायाम् तुदादिः",
    rom: "prach (prachaṁ) jñīpsāyām tudādiḥ"
  },
  'praW2_praWaz_curAxiH_praKyAne': {
    dev: "प्रथ् (प्रथँ) प्रख्याने चुरादिः",
    rom: "prath (prathaṁ) prakhyāne curādiḥ"
  },
  'praW1_praWaz_BvAxiH_praKyAne': {
    dev: "प्रथ् (प्रथँ) प्रख्याने भ्वादिः",
    rom: "prath (prathaṁ) prakhyāne bhvādiḥ"
  },
  'pras1_prasaz_BvAxiH_prasave': {
    dev: "प्रस् (प्रसँ) प्रसवे भ्वादिः",
    rom: "pras (prasaṁ) prasave bhvādiḥ"
  },
  'pras1_prasaz_BvAxiH_viswAre': {
    dev: "प्रस् (प्रसँ) विस्तारे भ्वादिः",
    rom: "pras (prasaṁ) vistāre bhvādiḥ"
  },
  'prA1_prA_axAxiH_pUraNe': {
    dev: "प्रा (प्रा) पूरणे अदादिः",
    rom: "prā (prā) pūraṇe adādiḥ"
  },
  'prI1_prIf_xivAxiH_prIwO': {
    dev: "प्री (प्रीङ्) प्रीतौ दिवादिः",
    rom: "prī (prīṅ) prītau divādiḥ"
  },
  'prI2_prIF_kryAxiH_kAnwO': {
    dev: "प्री (प्रीञ्) कान्तौ क्र्यादिः",
    rom: "prī (prīñ) kāntau kryādiḥ"
  },
  'prI2_prIF_kryAxiH_warpaNe': {
    dev: "प्री (प्रीञ्) तर्पणे क्र्यादिः",
    rom: "prī (prīñ) tarpaṇe kryādiḥ"
  },
  'prI3_prIF_curAxiH_warpaNe': {
    dev: "प्री (प्रीञ्) तर्पणे चुरादिः",
    rom: "prī (prīñ) tarpaṇe curādiḥ"
  },
  'pru1_pruf_BvAxiH_gawO': {
    dev: "प्रु (प्रुङ्) गतौ भ्वादिः",
    rom: "pru (pruṅ) gatau bhvādiḥ"
  },
  'pruR2_pruRaz_kryAxiH_pUraNe': {
    dev: "प्रुष् (प्रुषँ) पूरणे क्र्यादिः",
    rom: "pruṣ (pruṣaṁ) pūraṇe kryādiḥ"
  },
  'pruR2_pruRaz_kryAxiH_mocane': {
    dev: "प्रुष् (प्रुषँ) मोचने क्र्यादिः",
    rom: "pruṣ (pruṣaṁ) mocane kryādiḥ"
  },
  'pruR2_pruRaz_kryAxiH_secane': {
    dev: "प्रुष् (प्रुषँ) सेचने क्र्यादिः",
    rom: "pruṣ (pruṣaṁ) secane kryādiḥ"
  },
  'pruR2_pruRaz_kryAxiH_sevane': {
    dev: "प्रुष् (प्रुषँ) सेवने क्र्यादिः",
    rom: "pruṣ (pruṣaṁ) sevane kryādiḥ"
  },
  'pruR2_pruRaz_kryAxiH_snehane': {
    dev: "प्रुष् (प्रुषँ) स्नेहने क्र्यादिः",
    rom: "pruṣ (pruṣaṁ) snehane kryādiḥ"
  },
  'pruR1_pruRuz_BvAxiH_xAhe': {
    dev: "प्रुष् (प्रुषुँ) दाहे भ्वादिः",
    rom: "pruṣ (pruṣuṁ) dāhe bhvādiḥ"
  },
  'preR1_preRqz_BvAxiH_gawO': {
    dev: "प्रेष् (प्रेषृँ) गतौ भ्वादिः",
    rom: "preṣ (preṣṛṁ) gatau bhvādiḥ"
  },
  'preR1_preRqz_BvAxiH_yawne': {
    dev: "प्रेष् (प्रेषृँ) यत्ने भ्वादिः",
    rom: "preṣ (preṣṛṁ) yatne bhvādiḥ"
  },
  'proW1_proWqz_BvAxiH_paryApwO': {
    dev: "प्रोथ् (प्रोथृँ) पर्याप्तौ भ्वादिः",
    rom: "proth (prothṛṁ) paryāptau bhvādiḥ"
  },
  'plih1_plihaz_BvAxiH_gawO': {
    dev: "प्लिह् (प्लिहँ) गतौ भ्वादिः",
    rom: "plih (plihaṁ) gatau bhvādiḥ"
  },
  'plI1_plI_kryAxiH_gawO': {
    dev: "प्ली (प्ली) गतौ क्र्यादिः",
    rom: "plī (plī) gatau kryādiḥ"
  },
  'plI1_plI_kryAxiH_SleRaNe': {
    dev: "प्ली (प्ली) श्लेषणे क्र्यादिः",
    rom: "plī (plī) śleṣaṇe kryādiḥ"
  },
  'plu1_pluf_BvAxiH_gawO': {
    dev: "प्लु (प्लुङ्) गतौ भ्वादिः",
    rom: "plu (pluṅ) gatau bhvādiḥ"
  },
  'pluR2_pluRaz_xivAxiH_xAhe': {
    dev: "प्लुष् (प्लुषँ) दाहे दिवादिः",
    rom: "pluṣ (pluṣaṁ) dāhe divādiḥ"
  },
  'pluR3_pluRaz_kryAxiH_pUraNe': {
    dev: "प्लुष् (प्लुषँ) पूरणे क्र्यादिः",
    rom: "pluṣ (pluṣaṁ) pūraṇe kryādiḥ"
  },
  'pluR3_pluRaz_kryAxiH_mocane': {
    dev: "प्लुष् (प्लुषँ) मोचने क्र्यादिः",
    rom: "pluṣ (pluṣaṁ) mocane kryādiḥ"
  },
  'pluR3_pluRaz_kryAxiH_secane': {
    dev: "प्लुष् (प्लुषँ) सेचने क्र्यादिः",
    rom: "pluṣ (pluṣaṁ) secane kryādiḥ"
  },
  'pluR3_pluRaz_kryAxiH_sevane': {
    dev: "प्लुष् (प्लुषँ) सेवने क्र्यादिः",
    rom: "pluṣ (pluṣaṁ) sevane kryādiḥ"
  },
  'pluR3_pluRaz_kryAxiH_snehane': {
    dev: "प्लुष् (प्लुषँ) स्नेहने क्र्यादिः",
    rom: "pluṣ (pluṣaṁ) snehane kryādiḥ"
  },
  'pluR1_pluRuz_BvAxiH_xAhe': {
    dev: "प्लुष् (प्लुषुँ) दाहे भ्वादिः",
    rom: "pluṣ (pluṣuṁ) dāhe bhvādiḥ"
  },
  'pleb1_plebqz_BvAxiH_gawO': {
    dev: "प्लेब् (प्लेबृँ) गतौ भ्वादिः",
    rom: "pleb (plebṛṁ) gatau bhvādiḥ"
  },
  'plev1_plevqz_BvAxiH_gawO': {
    dev: "प्लेव् (प्लेवृँ) गतौ भ्वादिः",
    rom: "plev (plevṛṁ) gatau bhvādiḥ"
  },
  'plev1_plevqz_BvAxiH_sevane': {
    dev: "प्लेव् (प्लेवृँ) सेवने भ्वादिः",
    rom: "plev (plevṛṁ) sevane bhvādiḥ"
  },
  'psA1_psA_axAxiH_BakRaNe': {
    dev: "प्सा (प्सा) भक्षणे अदादिः",
    rom: "psā (psā) bhakṣaṇe adādiḥ"
  },
  'Pakk1_Pakkaz_BvAxiH_nIcErgawO': {
    dev: "फक्क् (फक्कँ) नीचैर्गतौ भ्वादिः",
    rom: "phakk (phakkaṁ) nīcairgatau bhvādiḥ"
  },
  'PaN1_PaNaz_BvAxiH_gawO': {
    dev: "फण् (फणँ) गतौ भ्वादिः",
    rom: "phaṇ (phaṇaṁ) gatau bhvādiḥ"
  },
  'Pal1_FiPalAz_BvAxiH_viSaraNe': {
    dev: "फल् (ञिफलाँ) विशरणे भ्वादिः",
    rom: "phal (ñiphalāṁ) viśaraṇe bhvādiḥ"
  },
  'Pal2_Palaz_BvAxiH_niRpawwO': {
    dev: "फल् (फलँ) निष्पत्तौ भ्वादिः",
    rom: "phal (phalaṁ) niṣpattau bhvādiḥ"
  },
  'Pull1_Pullaz_BvAxiH_vikasane': {
    dev: "फुल्ल् (फुल्लँ) विकसने भ्वादिः",
    rom: "phull (phullaṁ) vikasane bhvādiḥ"
  },
  'Pel1_Pelqz_BvAxiH_gawO': {
    dev: "फेल् (फेलृँ) गतौ भ्वादिः",
    rom: "phel (phelṛṁ) gatau bhvādiḥ"
  },
  'bax1_baxaz_BvAxiH_sWErye': {
    dev: "बद् (बदँ) स्थैर्ये भ्वादिः",
    rom: "bad (badaṁ) sthairye bhvādiḥ"
  },
  'baX1_baXaz_BvAxiH_banXane': {
    dev: "बध् (बधँ) बन्धने भ्वादिः",
    rom: "badh (badhaṁ) bandhane bhvādiḥ"
  },
  'baX2_baXaz_curAxiH_saMyamane': {
    dev: "बध् (बधँ) संयमने चुरादिः",
    rom: "badh (badhaṁ) saṃyamane curādiḥ"
  },
  'banX1_banXaz_kryAxiH_banXane': {
    dev: "बन्ध् (बन्धँ) बन्धने क्र्यादिः",
    rom: "bandh (bandhaṁ) bandhane kryādiḥ"
  },
  'baBr1_baBraz_BvAxiH_gawO': {
    dev: "बभ्र् (बभ्रँ) गतौ भ्वादिः",
    rom: "babhr (babhraṁ) gatau bhvādiḥ"
  },
  'barb1_barbaz_BvAxiH_gawO': {
    dev: "बर्ब् (बर्बँ) गतौ भ्वादिः",
    rom: "barb (barbaṁ) gatau bhvādiḥ"
  },
  'barh1_barhaz_BvAxiH_xAne': {
    dev: "बर्ह् (बर्हँ) दाने भ्वादिः",
    rom: "barh (barhaṁ) dāne bhvādiḥ"
  },
  'barh1_barhaz_BvAxiH_pariBARaNe': {
    dev: "बर्ह् (बर्हँ) परिभाषणे भ्वादिः",
    rom: "barh (barhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'barh1_barhaz_BvAxiH_prAXAnye': {
    dev: "बर्ह् (बर्हँ) प्राधान्ये भ्वादिः",
    rom: "barh (barhaṁ) prādhānye bhvādiḥ"
  },
  'barh2_barhaz_curAxiH_BAsArWe': {
    dev: "बर्ह् (बर्हँ) भासार्थे चुरादिः",
    rom: "barh (barhaṁ) bhāsārthe curādiḥ"
  },
  'barh2_barhaz_curAxiH_hiMsAyAm': {
    dev: "बर्ह् (बर्हँ) हिंसायाम् चुरादिः",
    rom: "barh (barhaṁ) hiṃsāyām curādiḥ"
  },
  'barh1_barhaz_BvAxiH_hiMsAyAm': {
    dev: "बर्ह् (बर्हँ) हिंसायाम् भ्वादिः",
    rom: "barh (barhaṁ) hiṃsāyām bhvādiḥ"
  },
  'bal1_balaz_BvAxiH_XAnyAvaroXe': {
    dev: "बल् (बलँ) धान्यावरोधे भ्वादिः",
    rom: "bal (balaṁ) dhānyāvarodhe bhvādiḥ"
  },
  'bal2_balaz_curAxiH_prANane': {
    dev: "बल् (बलँ) प्राणने चुरादिः",
    rom: "bal (balaṁ) prāṇane curādiḥ"
  },
  'bal1_balaz_BvAxiH_prANane': {
    dev: "बल् (बलँ) प्राणने भ्वादिः",
    rom: "bal (balaṁ) prāṇane bhvādiḥ"
  },
  'bal2_balaz_curAxiH_BqwO': {
    dev: "बल् (बलँ) भृतौ चुरादिः",
    rom: "bal (balaṁ) bhṛtau curādiḥ"
  },
  'balh1_balhaz_BvAxiH_xAne': {
    dev: "बल्ह् (बल्हँ) दाने भ्वादिः",
    rom: "balh (balhaṁ) dāne bhvādiḥ"
  },
  'balh1_balhaz_BvAxiH_pariBARaNe': {
    dev: "बल्ह् (बल्हँ) परिभाषणे भ्वादिः",
    rom: "balh (balhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'balh1_balhaz_BvAxiH_prAXAnye': {
    dev: "बल्ह् (बल्हँ) प्राधान्ये भ्वादिः",
    rom: "balh (balhaṁ) prādhānye bhvādiḥ"
  },
  'balh2_balhaz_curAxiH_BAsArWe': {
    dev: "बल्ह् (बल्हँ) भासार्थे चुरादिः",
    rom: "balh (balhaṁ) bhāsārthe curādiḥ"
  },
  'balh1_balhaz_BvAxiH_hiMsAyAm': {
    dev: "बल्ह् (बल्हँ) हिंसायाम् भ्वादिः",
    rom: "balh (balhaṁ) hiṃsāyām bhvādiḥ"
  },
  'baRka1_baRka_curAxiH_xarSane': {
    dev: "बष्क (बष्क) दर्शने चुरादिः",
    rom: "baṣka (baṣka) darśane curādiḥ"
  },
  'basw1_baswaz_curAxiH_arxane': {
    dev: "बस्त् (बस्तँ) अर्दने चुरादिः",
    rom: "bast (bastaṁ) ardane curādiḥ"
  },
  'bah2_bahiz_curAxiH_BAsArWe': {
    dev: "बह् (बहिँ) भासार्थे चुरादिः",
    rom: "bah (bahiṁ) bhāsārthe curādiḥ"
  },
  'bah1_bahiz_BvAxiH_vqxXO': {
    dev: "बह् (बहिँ) वृद्धौ भ्वादिः",
    rom: "bah (bahiṁ) vṛddhau bhvādiḥ"
  },
  'bAX1_bAXqz_BvAxiH_rotane': {
    dev: "बाध् (बाधृँ) रोटने भ्वादिः",
    rom: "bādh (bādhṛṁ) roṭane bhvādiḥ"
  },
  'bAX1_bAXqz_BvAxiH_lodane': {
    dev: "बाध् (बाधृँ) लोडने भ्वादिः",
    rom: "bādh (bādhṛṁ) loḍane bhvādiḥ"
  },
  'bAh1_bAhqz_BvAxiH_prayawne': {
    dev: "बाह् (बाहृँ) प्रयत्ने भ्वादिः",
    rom: "bāh (bāhṛṁ) prayatne bhvādiḥ"
  },
  'bit1_bitaz_BvAxiH_AkroSe': {
    dev: "बिट् (बिटँ) आक्रोशे भ्वादिः",
    rom: "biṭ (biṭaṁ) ākrośe bhvādiḥ"
  },
  'bid1_bidaz_BvAxiH_AkroSe': {
    dev: "बिड् (बिडँ) आक्रोशे भ्वादिः",
    rom: "biḍ (biḍaṁ) ākrośe bhvādiḥ"
  },
  'bix1_bixiz_BvAxiH_avayave': {
    dev: "बिद् (बिदिँ) अवयवे भ्वादिः",
    rom: "bid (bidiṁ) avayave bhvādiḥ"
  },
  'bil2_bilaz_curAxiH_Bexane': {
    dev: "बिल् (बिलँ) भेदने चुरादिः",
    rom: "bil (bilaṁ) bhedane curādiḥ"
  },
  'bil1_bilaz_wuxAxiH_Bexane': {
    dev: "बिल् (बिलँ) भेदने तुदादिः",
    rom: "bil (bilaṁ) bhedane tudādiḥ"
  },
  'bis1_bisaz_xivAxiH_preraNe': {
    dev: "बिस् (बिसँ) प्रेरणे दिवादिः",
    rom: "bis (bisaṁ) preraṇe divādiḥ"
  },
  'bukk1_bukkaz_BvAxiH_BaRaNe': {
    dev: "बुक्क् (बुक्कँ) भषणे भ्वादिः",
    rom: "bukk (bukkaṁ) bhaṣaṇe bhvādiḥ"
  },
  'bukk2_bukkaz_curAxiH_BARaNe': {
    dev: "बुक्क् (बुक्कँ) भाषणे चुरादिः",
    rom: "bukk (bukkaṁ) bhāṣaṇe curādiḥ"
  },
  'bukk1_bukkaz_BvAxiH_BARaNe': {
    dev: "बुक्क् (बुक्कँ) भाषणे भ्वादिः",
    rom: "bukk (bukkaṁ) bhāṣaṇe bhvādiḥ"
  },
  'bud1_budaz_wuxAxiH_saMvaraNe': {
    dev: "बुड् (बुडँ) संवरणे तुदादिः",
    rom: "buḍ (buḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'buX3_buXaz_xivAxiH_avagamane': {
    dev: "बुध् (बुधँ) अवगमने दिवादिः",
    rom: "budh (budhaṁ) avagamane divādiḥ"
  },
  'buX1_buXaz_BvAxiH_avagamane': {
    dev: "बुध् (बुधँ) अवगमने भ्वादिः",
    rom: "budh (budhaṁ) avagamane bhvādiḥ"
  },
  'buX2_buXizr_BvAxiH_boXane': {
    dev: "बुध् (बुधिँर्) बोधने भ्वादिः",
    rom: "budh (budhiṁr) bodhane bhvādiḥ"
  },
  'bunx1_uzbunxizr_BvAxiH_niSAmane': {
    dev: "बुन्द् (उँबुन्दिँर्) निशामने भ्वादिः",
    rom: "bund (uṁbundiṁr) niśāmane bhvādiḥ"
  },
  'bul1_bulaz_curAxiH_nimajjane': {
    dev: "बुल् (बुलँ) निमज्जने चुरादिः",
    rom: "bul (bulaṁ) nimajjane curādiḥ"
  },
  'bus1_busaz_xivAxiH_uwsarge': {
    dev: "बुस् (बुसँ) उत्सर्गे दिवादिः",
    rom: "bus (busaṁ) utsarge divādiḥ"
  },
  'busw1_buswaz_curAxiH_anAxare': {
    dev: "बुस्त् (बुस्तँ) अनादरे चुरादिः",
    rom: "bust (bustaṁ) anādare curādiḥ"
  },
  'busw1_buswaz_curAxiH_Axare': {
    dev: "बुस्त् (बुस्तँ) आदरे चुरादिः",
    rom: "bust (bustaṁ) ādare curādiḥ"
  },
  'bqh1_bqhaz_BvAxiH_vqxXO': {
    dev: "बृह् (बृहँ) वृद्धौ भ्वादिः",
    rom: "bṛh (bṛhaṁ) vṛddhau bhvādiḥ"
  },
  'bqh2_bqhiz_BvAxiH_vqxXO': {
    dev: "बृह् (बृहिँ) वृद्धौ भ्वादिः",
    rom: "bṛh (bṛhiṁ) vṛddhau bhvādiḥ"
  },
  'bqh2_bqhiz_BvAxiH_Sabxe': {
    dev: "बृह् (बृहिँ) शब्दे भ्वादिः",
    rom: "bṛh (bṛhiṁ) śabde bhvādiḥ"
  },
  'bqh3_bqhuz_wuxAxiH_uxyamane': {
    dev: "बृह् (बृहुँ) उद्यमने तुदादिः",
    rom: "bṛh (bṛhuṁ) udyamane tudādiḥ"
  },
  'brIs1_brIsaz_curAxiH_hiMsAyAm': {
    dev: "ब्रीस् (ब्रीसँ) हिंसायाम् चुरादिः",
    rom: "brīs (brīsaṁ) hiṃsāyām curādiḥ"
  },
  'brU1_brUF_axAxiH_vyakwAyAM_vAci': {
    dev: "ब्रू (ब्रूञ्) व्यक्तायां_वाचि अदादिः",
    rom: "brū (brūñ) vyaktāyāṃ_vāci adādiḥ"
  },
  'brUs1_brUsaz_curAxiH_hiMsAyAm': {
    dev: "ब्रूस् (ब्रूसँ) हिंसायाम् चुरादिः",
    rom: "brūs (brūsaṁ) hiṃsāyām curādiḥ"
  },
  'blI1_blI_kryAxiH_varaNe': {
    dev: "ब्ली (ब्ली) वरणे क्र्यादिः",
    rom: "blī (blī) varaṇe kryādiḥ"
  },
  'bleRka1_bleRka_curAxiH_xarSane': {
    dev: "ब्लेष्क (ब्लेष्क) दर्शने चुरादिः",
    rom: "bleṣka (bleṣka) darśane curādiḥ"
  },
  'BakR2_BakRaz_curAxiH_axane': {
    dev: "भक्ष् (भक्षँ) अदने चुरादिः",
    rom: "bhakṣ (bhakṣaṁ) adane curādiḥ"
  },
  'BakR1_BakRaz_BvAxiH_BakRaNe': {
    dev: "भक्ष् (भक्षँ) भक्षणे भ्वादिः",
    rom: "bhakṣ (bhakṣaṁ) bhakṣaṇe bhvādiḥ"
  },
  'Baj2_Bajaz_curAxiH_viSrANane': {
    dev: "भज् (भजँ) विश्राणने चुरादिः",
    rom: "bhaj (bhajaṁ) viśrāṇane curādiḥ"
  },
  'Baj1_Bajaz_BvAxiH_sevAyAm': {
    dev: "भज् (भजँ) सेवायाम् भ्वादिः",
    rom: "bhaj (bhajaṁ) sevāyām bhvādiḥ"
  },
  'Baj3_Bajiz_curAxiH_BARArWe': {
    dev: "भज् (भजिँ) भाषार्थे चुरादिः",
    rom: "bhaj (bhajiṁ) bhāṣārthe curādiḥ"
  },
  'Bat1_Bataz_BvAxiH_pariBARaNe': {
    dev: "भट् (भटँ) परिभाषणे भ्वादिः",
    rom: "bhaṭ (bhaṭaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'Bat1_Bataz_BvAxiH_BqwO': {
    dev: "भट् (भटँ) भृतौ भ्वादिः",
    rom: "bhaṭ (bhaṭaṁ) bhṛtau bhvādiḥ"
  },
  'Bad2_Badiz_curAxiH_kalyANe': {
    dev: "भड् (भडिँ) कल्याणे चुरादिः",
    rom: "bhaḍ (bhaḍiṁ) kalyāṇe curādiḥ"
  },
  'Bad1_Badiz_BvAxiH_pariBARaNe': {
    dev: "भड् (भडिँ) परिभाषणे भ्वादिः",
    rom: "bhaḍ (bhaḍiṁ) paribhāṣaṇe bhvādiḥ"
  },
  'Bad1_Badiz_BvAxiH_parihAse': {
    dev: "भड् (भडिँ) परिहासे भ्वादिः",
    rom: "bhaḍ (bhaḍiṁ) parihāse bhvādiḥ"
  },
  'BaN1_BaNaz_BvAxiH_Sabxe': {
    dev: "भण् (भणँ) शब्दे भ्वादिः",
    rom: "bhaṇ (bhaṇaṁ) śabde bhvādiḥ"
  },
  'Bax1_Baxiz_BvAxiH_kalyANe': {
    dev: "भद् (भदिँ) कल्याणे भ्वादिः",
    rom: "bhad (bhadiṁ) kalyāṇe bhvādiḥ"
  },
  'Bax1_Baxiz_BvAxiH_suKe': {
    dev: "भद् (भदिँ) सुखे भ्वादिः",
    rom: "bhad (bhadiṁ) sukhe bhvādiḥ"
  },
  'Banj1_Banjoz_ruXAxiH_Amarxane': {
    dev: "भन्ज् (भन्जोँ) आमर्दने रुधादिः",
    rom: "bhanj (bhanjoṁ) āmardane rudhādiḥ"
  },
  'Barws1_Barwsaz_curAxiH_sanwarjane': {
    dev: "भर्त्स् (भर्त्सँ) सन्तर्जने चुरादिः",
    rom: "bharts (bhartsaṁ) santarjane curādiḥ"
  },
  'Barb1_Barbaz_BvAxiH_gawO': {
    dev: "भर्ब् (भर्बँ) गतौ भ्वादिः",
    rom: "bharb (bharbaṁ) gatau bhvādiḥ"
  },
  'Barv1_Barvaz_BvAxiH_hiMsAyAm': {
    dev: "भर्व् (भर्वँ) हिंसायाम् भ्वादिः",
    rom: "bharv (bharvaṁ) hiṃsāyām bhvādiḥ"
  },
  'Bal2_Balaz_curAxiH_ABaNdane': {
    dev: "भल् (भलँ) आभण्डने चुरादिः",
    rom: "bhal (bhalaṁ) ābhaṇḍane curādiḥ"
  },
  'Bal1_Balaz_BvAxiH_xAne': {
    dev: "भल् (भलँ) दाने भ्वादिः",
    rom: "bhal (bhalaṁ) dāne bhvādiḥ"
  },
  'Bal1_Balaz_BvAxiH_pariBARaNe': {
    dev: "भल् (भलँ) परिभाषणे भ्वादिः",
    rom: "bhal (bhalaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'Bal1_Balaz_BvAxiH_hiMsAyAm': {
    dev: "भल् (भलँ) हिंसायाम् भ्वादिः",
    rom: "bhal (bhalaṁ) hiṃsāyām bhvādiḥ"
  },
  'Ball1_Ballaz_BvAxiH_xAne': {
    dev: "भल्ल् (भल्लँ) दाने भ्वादिः",
    rom: "bhall (bhallaṁ) dāne bhvādiḥ"
  },
  'Ball1_Ballaz_BvAxiH_pariBARaNe': {
    dev: "भल्ल् (भल्लँ) परिभाषणे भ्वादिः",
    rom: "bhall (bhallaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'Ball1_Ballaz_BvAxiH_hiMsAyAm': {
    dev: "भल्ल् (भल्लँ) हिंसायाम् भ्वादिः",
    rom: "bhall (bhallaṁ) hiṃsāyām bhvādiḥ"
  },
  'BaR1_BaRaz_BvAxiH_Barwsane': {
    dev: "भष् (भषँ) भर्त्सने भ्वादिः",
    rom: "bhaṣ (bhaṣaṁ) bhartsane bhvādiḥ"
  },
  'Bas1_Basaz_juhowyAxiH_xIpwO': {
    dev: "भस् (भसँ) दीप्तौ जुहोत्यादिः",
    rom: "bhas (bhasaṁ) dīptau juhotyādiḥ"
  },
  'Bas1_Basaz_juhowyAxiH_Barwsane': {
    dev: "भस् (भसँ) भर्त्सने जुहोत्यादिः",
    rom: "bhas (bhasaṁ) bhartsane juhotyādiḥ"
  },
  'BA1_BA_axAxiH_xIpwO': {
    dev: "भा (भा) दीप्तौ अदादिः",
    rom: "bhā (bhā) dīptau adādiḥ"
  },
  'BAja1_BAja_curAxiH_pqWakkarmaNi': {
    dev: "भाज (भाज) पृथक्कर्मणि चुरादिः",
    rom: "bhāja (bhāja) pṛthakkarmaṇi curādiḥ"
  },
  'BAma1_BAma_curAxiH_kroXe': {
    dev: "भाम (भाम) क्रोधे चुरादिः",
    rom: "bhāma (bhāma) krodhe curādiḥ"
  },
  'BAm1_BAmaz_BvAxiH_kroXe': {
    dev: "भाम् (भामँ) क्रोधे भ्वादिः",
    rom: "bhām (bhāmaṁ) krodhe bhvādiḥ"
  },
  'BAR1_BARaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "भाष् (भाषँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "bhāṣ (bhāṣaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'BAs1_BAsqz_BvAxiH_xIpwO': {
    dev: "भास् (भासृँ) दीप्तौ भ्वादिः",
    rom: "bhās (bhāsṛṁ) dīptau bhvādiḥ"
  },
  'BikR1_BikRaz_BvAxiH_alABe': {
    dev: "भिक्ष् (भिक्षँ) अलाभे भ्वादिः",
    rom: "bhikṣ (bhikṣaṁ) alābhe bhvādiḥ"
  },
  'BikR1_BikRaz_BvAxiH_BikRAyAm': {
    dev: "भिक्ष् (भिक्षँ) भिक्षायाम् भ्वादिः",
    rom: "bhikṣ (bhikṣaṁ) bhikṣāyām bhvādiḥ"
  },
  'BikR1_BikRaz_BvAxiH_yAFcAyAm': {
    dev: "भिक्ष् (भिक्षँ) याञ्चायाम् भ्वादिः",
    rom: "bhikṣ (bhikṣaṁ) yāñcāyām bhvādiḥ"
  },
  'BikR1_BikRaz_BvAxiH_lABe': {
    dev: "भिक्ष् (भिक्षँ) लाभे भ्वादिः",
    rom: "bhikṣ (bhikṣaṁ) lābhe bhvādiḥ"
  },
  'Bix1_Bixizr_ruXAxiH_vixAraNe': {
    dev: "भिद् (भिदिँर्) विदारणे रुधादिः",
    rom: "bhid (bhidiṁr) vidāraṇe rudhādiḥ"
  },
  'BI1_FiBI_juhowyAxiH_Baye': {
    dev: "भी (ञिभी) भये जुहोत्यादिः",
    rom: "bhī (ñibhī) bhaye juhotyādiḥ"
  },
  'Buj2_Bujaz_ruXAxiH_aByavahAre': {
    dev: "भुज् (भुजँ) अभ्यवहारे रुधादिः",
    rom: "bhuj (bhujaṁ) abhyavahāre rudhādiḥ"
  },
  'Buj2_Bujaz_ruXAxiH_pAlane': {
    dev: "भुज् (भुजँ) पालने रुधादिः",
    rom: "bhuj (bhujaṁ) pālane rudhādiḥ"
  },
  'Buj3_Bujiz_curAxiH_BARArWe': {
    dev: "भुज् (भुजिँ) भाषार्थे चुरादिः",
    rom: "bhuj (bhujiṁ) bhāṣārthe curādiḥ"
  },
  'Buj1_Bujoz_wuxAxiH_kOtilye': {
    dev: "भुज् (भुजोँ) कौटिल्ये तुदादिः",
    rom: "bhuj (bhujoṁ) kauṭilye tudādiḥ"
  },
  'Buv1_Buvoz_curAxiH_avakalkane': {
    dev: "भुव् (भुवोँ) अवकल्कने चुरादिः",
    rom: "bhuv (bhuvoṁ) avakalkane curādiḥ"
  },
  'BU2_BU_curAxiH_prApwO': {
    dev: "भू (भू) प्राप्तौ चुरादिः",
    rom: "bhū (bhū) prāptau curādiḥ"
  },
  'BU1_BU_BvAxiH_sawwAyAm': {
    dev: "भू (भू) सत्तायाम् भ्वादिः",
    rom: "bhū (bhū) sattāyām bhvādiḥ"
  },
  'BUR2_BURaz_curAxiH_alafkAre': {
    dev: "भूष् (भूषँ) अलङ्कारे चुरादिः",
    rom: "bhūṣ (bhūṣaṁ) alaṅkāre curādiḥ"
  },
  'BUR1_BURaz_BvAxiH_alafkAre': {
    dev: "भूष् (भूषँ) अलङ्कारे भ्वादिः",
    rom: "bhūṣ (bhūṣaṁ) alaṅkāre bhvādiḥ"
  },
  'Bq2_duBqF_juhowyAxiH_XAraNe': {
    dev: "भृ (डुभृञ्) धारणे जुहोत्यादिः",
    rom: "bhṛ (ḍubhṛñ) dhāraṇe juhotyādiḥ"
  },
  'Bq2_duBqF_juhowyAxiH_poRaNe': {
    dev: "भृ (डुभृञ्) पोषणे जुहोत्यादिः",
    rom: "bhṛ (ḍubhṛñ) poṣaṇe juhotyādiḥ"
  },
  'Bq1_BqF_BvAxiH_BaraNe': {
    dev: "भृ (भृञ्) भरणे भ्वादिः",
    rom: "bhṛ (bhṛñ) bharaṇe bhvādiḥ"
  },
  'Bqj1_BqjIz_BvAxiH_Barjane': {
    dev: "भृज् (भृजीँ) भर्जने भ्वादिः",
    rom: "bhṛj (bhṛjīṁ) bharjane bhvādiḥ"
  },
  'BqS2_BqSiz_curAxiH_BARArWe': {
    dev: "भृश् (भृशिँ) भाषार्थे चुरादिः",
    rom: "bhṛś (bhṛśiṁ) bhāṣārthe curādiḥ"
  },
  'BqS1_BqSuz_xivAxiH_aXaHpawane': {
    dev: "भृश् (भृशुँ) अधःपतने दिवादिः",
    rom: "bhṛś (bhṛśuṁ) adhaḥpatane divādiḥ"
  },
  'BqR1_BqRuz_BvAxiH_safGAwe': {
    dev: "भृष् (भृषुँ) सङ्घाते भ्वादिः",
    rom: "bhṛṣ (bhṛṣuṁ) saṅghāte bhvādiḥ"
  },
  'BqR1_BqRuz_BvAxiH_hiMsAyAm': {
    dev: "भृष् (भृषुँ) हिंसायाम् भ्वादिः",
    rom: "bhṛṣ (bhṛṣuṁ) hiṃsāyām bhvādiḥ"
  },
  'BQ1_BQ_kryAxiH_BaraNe': {
    dev: "भॄ (भॄ) भरणे क्र्यादिः",
    rom: "bhṝ (bhṝ) bharaṇe kryādiḥ"
  },
  'BQ1_BQ_kryAxiH_Barjane': {
    dev: "भॄ (भॄ) भर्जने क्र्यादिः",
    rom: "bhṝ (bhṝ) bharjane kryādiḥ"
  },
  'BQ1_BQ_kryAxiH_Barwsane': {
    dev: "भॄ (भॄ) भर्त्सने क्र्यादिः",
    rom: "bhṝ (bhṝ) bhartsane kryādiḥ"
  },
  'BeR1_BeRqz_BvAxiH_Baye': {
    dev: "भेष् (भेषृँ) भये भ्वादिः",
    rom: "bheṣ (bheṣṛṁ) bhaye bhvādiḥ"
  },
  'Byas1_Byasaz_BvAxiH_Baye': {
    dev: "भ्यस् (भ्यसँ) भये भ्वादिः",
    rom: "bhyas (bhyasaṁ) bhaye bhvādiḥ"
  },
  'BrakR1_BrakRaz_BvAxiH_axane': {
    dev: "भ्रक्ष् (भ्रक्षँ) अदने भ्वादिः",
    rom: "bhrakṣ (bhrakṣaṁ) adane bhvādiḥ"
  },
  'BraN1_BraNaz_BvAxiH_Sabxe': {
    dev: "भ्रण् (भ्रणँ) शब्दे भ्वादिः",
    rom: "bhraṇ (bhraṇaṁ) śabde bhvādiḥ"
  },
  'BranS2_BranSuz_xivAxiH_aXaHpawane': {
    dev: "भ्रन्श् (भ्रन्शुँ) अधःपतने दिवादिः",
    rom: "bhranś (bhranśuṁ) adhaḥpatane divādiḥ"
  },
  'BranS1_BranSuz_BvAxiH_aXaHpawane': {
    dev: "भ्रन्श् (भ्रन्शुँ) अधःपतने भ्वादिः",
    rom: "bhranś (bhranśuṁ) adhaḥpatane bhvādiḥ"
  },
  'BranS1_BranSuz_BvAxiH_avasraMsane': {
    dev: "भ्रन्श् (भ्रन्शुँ) अवस्रंसने भ्वादिः",
    rom: "bhranś (bhranśuṁ) avasraṃsane bhvādiḥ"
  },
  'Brans1_Bransuz_BvAxiH_avasraMsane': {
    dev: "भ्रन्स् (भ्रन्सुँ) अवस्रंसने भ्वादिः",
    rom: "bhrans (bhransuṁ) avasraṃsane bhvādiḥ"
  },
  'Bram2_Bramuz_xivAxiH_anavasWAne': {
    dev: "भ्रम् (भ्रमुँ) अनवस्थाने दिवादिः",
    rom: "bhram (bhramuṁ) anavasthāne divādiḥ"
  },
  'Bram1_Bramuz_BvAxiH_calane': {
    dev: "भ्रम् (भ्रमुँ) चलने भ्वादिः",
    rom: "bhram (bhramuṁ) calane bhvādiḥ"
  },
  'Brasj1_Brasjaz_wuxAxiH_pAke': {
    dev: "भ्रस्ज् (भ्रस्जँ) पाके तुदादिः",
    rom: "bhrasj (bhrasjaṁ) pāke tudādiḥ"
  },
  'BrAj2_tuBrAjqz_BvAxiH_xIpwO': {
    dev: "भ्राज् (टुभ्राजृँ) दीप्तौ भ्वादिः",
    rom: "bhrāj (ṭubhrājṛṁ) dīptau bhvādiḥ"
  },
  'BrAj1_BrAjqz_BvAxiH_xIpwO': {
    dev: "भ्राज् (भ्राजृँ) दीप्तौ भ्वादिः",
    rom: "bhrāj (bhrājṛṁ) dīptau bhvādiḥ"
  },
  'BrAS1_tuBrASqz_BvAxiH_xIpwO': {
    dev: "भ्राश् (टुभ्राशृँ) दीप्तौ भ्वादिः",
    rom: "bhrāś (ṭubhrāśṛṁ) dīptau bhvādiḥ"
  },
  'BrI1_BrI_kryAxiH_Baye': {
    dev: "भ्री (भ्री) भये क्र्यादिः",
    rom: "bhrī (bhrī) bhaye kryādiḥ"
  },
  'BrI1_BrI_kryAxiH_BaraNe': {
    dev: "भ्री (भ्री) भरणे क्र्यादिः",
    rom: "bhrī (bhrī) bharaṇe kryādiḥ"
  },
  'Brud1_Brudaz_wuxAxiH_saMvaraNe': {
    dev: "भ्रुड् (भ्रुडँ) संवरणे तुदादिः",
    rom: "bhruḍ (bhruḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'BrUN1_BrUNaz_curAxiH_ASAyAm': {
    dev: "भ्रूण् (भ्रूणँ) आशायाम् चुरादिः",
    rom: "bhrūṇ (bhrūṇaṁ) āśāyām curādiḥ"
  },
  'Brej1_Brejqz_BvAxiH_xIpwO': {
    dev: "भ्रेज् (भ्रेजृँ) दीप्तौ भ्वादिः",
    rom: "bhrej (bhrejṛṁ) dīptau bhvādiḥ"
  },
  'BreR1_BreRqz_BvAxiH_gawO': {
    dev: "भ्रेष् (भ्रेषृँ) गतौ भ्वादिः",
    rom: "bhreṣ (bhreṣṛṁ) gatau bhvādiḥ"
  },
  'BreR1_BreRqz_BvAxiH_calane': {
    dev: "भ्रेष् (भ्रेषृँ) चलने भ्वादिः",
    rom: "bhreṣ (bhreṣṛṁ) calane bhvādiḥ"
  },
  'BreR1_BreRqz_BvAxiH_Baye': {
    dev: "भ्रेष् (भ्रेषृँ) भये भ्वादिः",
    rom: "bhreṣ (bhreṣṛṁ) bhaye bhvādiḥ"
  },
  'BlakR1_BlakRaz_BvAxiH_BakRaNe': {
    dev: "भ्लक्ष् (भ्लक्षँ) भक्षणे भ्वादिः",
    rom: "bhlakṣ (bhlakṣaṁ) bhakṣaṇe bhvādiḥ"
  },
  'BlAS1_tuBlASqz_BvAxiH_xIpwO': {
    dev: "भ्लाश् (टुभ्लाशृँ) दीप्तौ भ्वादिः",
    rom: "bhlāś (ṭubhlāśṛṁ) dīptau bhvādiḥ"
  },
  'BleR1_BleRqz_BvAxiH_calane': {
    dev: "भ्लेष् (भ्लेषृँ) चलने भ्वादिः",
    rom: "bhleṣ (bhleṣṛṁ) calane bhvādiḥ"
  },
  'mak1_makiz_BvAxiH_maNdane': {
    dev: "मक् (मकिँ) मण्डने भ्वादिः",
    rom: "mak (makiṁ) maṇḍane bhvādiḥ"
  },
  'makR1_makRaz_BvAxiH_roRe': {
    dev: "मक्ष् (मक्षँ) रोषे भ्वादिः",
    rom: "makṣ (makṣaṁ) roṣe bhvādiḥ"
  },
  'maK1_maKaz_BvAxiH_gawO': {
    dev: "मख् (मखँ) गतौ भ्वादिः",
    rom: "makh (makhaṁ) gatau bhvādiḥ"
  },
  'maK2_maKiz_BvAxiH_gawO': {
    dev: "मख् (मखिँ) गतौ भ्वादिः",
    rom: "makh (makhiṁ) gatau bhvādiḥ"
  },
  'mag1_magiz_BvAxiH_gawO': {
    dev: "मग् (मगिँ) गतौ भ्वादिः",
    rom: "mag (magiṁ) gatau bhvādiḥ"
  },
  'maG1_maGiz_BvAxiH_kEwave': {
    dev: "मघ् (मघिँ) कैतवे भ्वादिः",
    rom: "magh (maghiṁ) kaitave bhvādiḥ"
  },
  'maG1_maGiz_BvAxiH_gawyAkRepe': {
    dev: "मघ् (मघिँ) गत्याक्षेपे भ्वादिः",
    rom: "magh (maghiṁ) gatyākṣepe bhvādiḥ"
  },
  'maG2_maGiz_BvAxiH_maNdane': {
    dev: "मघ् (मघिँ) मण्डने भ्वादिः",
    rom: "magh (maghiṁ) maṇḍane bhvādiḥ"
  },
  'mac1_macaz_BvAxiH_kalkane': {
    dev: "मच् (मचँ) कल्कने भ्वादिः",
    rom: "mac (macaṁ) kalkane bhvādiḥ"
  },
  'mac2_maciz_BvAxiH_ucCrAye': {
    dev: "मच् (मचिँ) उच्छ्राये भ्वादिः",
    rom: "mac (maciṁ) ucchrāye bhvādiḥ"
  },
  'mac2_maciz_BvAxiH_XAraNe': {
    dev: "मच् (मचिँ) धारणे भ्वादिः",
    rom: "mac (maciṁ) dhāraṇe bhvādiḥ"
  },
  'mac2_maciz_BvAxiH_pUjane': {
    dev: "मच् (मचिँ) पूजने भ्वादिः",
    rom: "mac (maciṁ) pūjane bhvādiḥ"
  },
  'maj1_majaz_BvAxiH_Sabxe': {
    dev: "मज् (मजँ) शब्दे भ्वादिः",
    rom: "maj (majaṁ) śabde bhvādiḥ"
  },
  'maT1_maTaz_BvAxiH_nivAse': {
    dev: "मठ् (मठँ) निवासे भ्वादिः",
    rom: "maṭh (maṭhaṁ) nivāse bhvādiḥ"
  },
  'maT1_maTaz_BvAxiH_maxe': {
    dev: "मठ् (मठँ) मदे भ्वादिः",
    rom: "maṭh (maṭhaṁ) made bhvādiḥ"
  },
  'maT2_maTiz_BvAxiH_Soke': {
    dev: "मठ् (मठिँ) शोके भ्वादिः",
    rom: "maṭh (maṭhiṁ) śoke bhvādiḥ"
  },
  'mad3_madiz_curAxiH_BURAyAm': {
    dev: "मड् (मडिँ) भूषायाम् चुरादिः",
    rom: "maḍ (maḍiṁ) bhūṣāyām curādiḥ"
  },
  'mad1_madiz_BvAxiH_BURAyAm': {
    dev: "मड् (मडिँ) भूषायाम् भ्वादिः",
    rom: "maḍ (maḍiṁ) bhūṣāyām bhvādiḥ"
  },
  'mad2_madiz_BvAxiH_viBAjane': {
    dev: "मड् (मडिँ) विभाजने भ्वादिः",
    rom: "maḍ (maḍiṁ) vibhājane bhvādiḥ"
  },
  'mad2_madiz_BvAxiH_veRtane': {
    dev: "मड् (मडिँ) वेष्टने भ्वादिः",
    rom: "maḍ (maḍiṁ) veṣṭane bhvādiḥ"
  },
  'mad3_madiz_curAxiH_harRe': {
    dev: "मड् (मडिँ) हर्षे चुरादिः",
    rom: "maḍ (maḍiṁ) harṣe curādiḥ"
  },
  'maN1_maNaz_BvAxiH_Sabxe': {
    dev: "मण् (मणँ) शब्दे भ्वादिः",
    rom: "maṇ (maṇaṁ) śabde bhvādiḥ"
  },
  'mawr1_mawriz_curAxiH_gupwaBARaNe': {
    dev: "मत्र् (मत्रिँ) गुप्तभाषणे चुरादिः",
    rom: "matr (matriṁ) guptabhāṣaṇe curādiḥ"
  },
  'maW2_maWiz_BvAxiH_safkleSane': {
    dev: "मथ् (मथिँ) सङ्क्लेशने भ्वादिः",
    rom: "math (mathiṁ) saṅkleśane bhvādiḥ"
  },
  'maW2_maWiz_BvAxiH_hiMsAyAm': {
    dev: "मथ् (मथिँ) हिंसायाम् भ्वादिः",
    rom: "math (mathiṁ) hiṃsāyām bhvādiḥ"
  },
  'maW1_maWez_BvAxiH_vilodane': {
    dev: "मथ् (मथेँ) विलोडने भ्वादिः",
    rom: "math (matheṁ) viloḍane bhvādiḥ"
  },
  'max3_maxaz_curAxiH_wqpwiyoge': {
    dev: "मद् (मदँ) तृप्तियोगे चुरादिः",
    rom: "mad (madaṁ) tṛptiyoge curādiḥ"
  },
  'max1_maxiz_BvAxiH_kAnwO': {
    dev: "मद् (मदिँ) कान्तौ भ्वादिः",
    rom: "mad (madiṁ) kāntau bhvādiḥ"
  },
  'max1_maxiz_BvAxiH_gawO': {
    dev: "मद् (मदिँ) गतौ भ्वादिः",
    rom: "mad (madiṁ) gatau bhvādiḥ"
  },
  'max1_maxiz_BvAxiH_maxe': {
    dev: "मद् (मदिँ) मदे भ्वादिः",
    rom: "mad (madiṁ) made bhvādiḥ"
  },
  'max1_maxiz_BvAxiH_moxane': {
    dev: "मद् (मदिँ) मोदने भ्वादिः",
    rom: "mad (madiṁ) modane bhvādiḥ"
  },
  'max1_maxiz_BvAxiH_swuwO': {
    dev: "मद् (मदिँ) स्तुतौ भ्वादिः",
    rom: "mad (madiṁ) stutau bhvādiḥ"
  },
  'max1_maxiz_BvAxiH_svapne': {
    dev: "मद् (मदिँ) स्वप्ने भ्वादिः",
    rom: "mad (madiṁ) svapne bhvādiḥ"
  },
  'max2_maxIz_xivAxiH_harRe': {
    dev: "मद् (मदीँ) हर्षे दिवादिः",
    rom: "mad (madīṁ) harṣe divādiḥ"
  },
  'man1_manaz_xivAxiH_jFAne': {
    dev: "मन् (मनँ) ज्ञाने दिवादिः",
    rom: "man (manaṁ) jñāne divādiḥ"
  },
  'man2_manaz_wanAxiH_avaboXane': {
    dev: "मन् (मनँ) अवबोधने तनादिः",
    rom: "man (manaṁ) avabodhane tanādiḥ"
  },
  'man3_manaz_curAxiH_swamBe': {
    dev: "मन् (मनँ) स्तम्भे चुरादिः",
    rom: "man (manaṁ) stambhe curādiḥ"
  },
  'manW2_manWaz_kryAxiH_vilodane': {
    dev: "मन्थ् (मन्थँ) विलोडने क्र्यादिः",
    rom: "manth (manthaṁ) viloḍane kryādiḥ"
  },
  'manW1_manWaz_BvAxiH_vilodane': {
    dev: "मन्थ् (मन्थँ) विलोडने भ्वादिः",
    rom: "manth (manthaṁ) viloḍane bhvādiḥ"
  },
  'manW1_manWaz_BvAxiH_safkleSane': {
    dev: "मन्थ् (मन्थँ) सङ्क्लेशने भ्वादिः",
    rom: "manth (manthaṁ) saṅkleśane bhvādiḥ"
  },
  'manW1_manWaz_BvAxiH_hiMsAyAm': {
    dev: "मन्थ् (मन्थँ) हिंसायाम् भ्वादिः",
    rom: "manth (manthaṁ) hiṃsāyām bhvādiḥ"
  },
  'maBr1_maBraz_BvAxiH_gawO': {
    dev: "मभ्र् (मभ्रँ) गतौ भ्वादिः",
    rom: "mabhr (mabhraṁ) gatau bhvādiḥ"
  },
  'may1_mayaz_BvAxiH_gawO': {
    dev: "मय् (मयँ) गतौ भ्वादिः",
    rom: "may (mayaṁ) gatau bhvādiḥ"
  },
  'marc1_marcaz_curAxiH_Sabxe': {
    dev: "मर्च् (मर्चँ) शब्दे चुरादिः",
    rom: "marc (marcaṁ) śabde curādiḥ"
  },
  'marb1_marbaz_BvAxiH_gawO': {
    dev: "मर्ब् (मर्बँ) गतौ भ्वादिः",
    rom: "marb (marbaṁ) gatau bhvādiḥ"
  },
  'marv1_marvaz_BvAxiH_pUraNe': {
    dev: "मर्व् (मर्वँ) पूरणे भ्वादिः",
    rom: "marv (marvaṁ) pūraṇe bhvādiḥ"
  },
  'marv1_marvaz_BvAxiH_pUrwO': {
    dev: "मर्व् (मर्वँ) पूर्तौ भ्वादिः",
    rom: "marv (marvaṁ) pūrtau bhvādiḥ"
  },
  'mal1_malaz_BvAxiH_XAraNe': {
    dev: "मल् (मलँ) धारणे भ्वादिः",
    rom: "mal (malaṁ) dhāraṇe bhvādiḥ"
  },
  'mall1_mallaz_BvAxiH_XAraNe': {
    dev: "मल्ल् (मल्लँ) धारणे भ्वादिः",
    rom: "mall (mallaṁ) dhāraṇe bhvādiḥ"
  },
  'mav1_mavaz_BvAxiH_banXane': {
    dev: "मव् (मवँ) बन्धने भ्वादिः",
    rom: "mav (mavaṁ) bandhane bhvādiḥ"
  },
  'mavy1_mavyaz_BvAxiH_banXane': {
    dev: "मव्य् (मव्यँ) बन्धने भ्वादिः",
    rom: "mavy (mavyaṁ) bandhane bhvādiḥ"
  },
  'maS1_maSaz_BvAxiH_roRe': {
    dev: "मश् (मशँ) रोषे भ्वादिः",
    rom: "maś (maśaṁ) roṣe bhvādiḥ"
  },
  'maS1_maSaz_BvAxiH_Sabxe': {
    dev: "मश् (मशँ) शब्दे भ्वादिः",
    rom: "maś (maśaṁ) śabde bhvādiḥ"
  },
  'maS1_maSaz_BvAxiH_samAXO': {
    dev: "मश् (मशँ) समाधौ भ्वादिः",
    rom: "maś (maśaṁ) samādhau bhvādiḥ"
  },
  'maR1_maRaz_BvAxiH_hiMsAyAm': {
    dev: "मष् (मषँ) हिंसायाम् भ्वादिः",
    rom: "maṣ (maṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'mas1_masIz_xivAxiH_pariNAme': {
    dev: "मस् (मसीँ) परिणामे दिवादिः",
    rom: "mas (masīṁ) pariṇāme divādiḥ"
  },
  'mas1_masIz_xivAxiH_parimANe': {
    dev: "मस् (मसीँ) परिमाणे दिवादिः",
    rom: "mas (masīṁ) parimāṇe divādiḥ"
  },
  'mas1_masIz_xivAxiH_pramANe': {
    dev: "मस् (मसीँ) प्रमाणे दिवादिः",
    rom: "mas (masīṁ) pramāṇe divādiḥ"
  },
  'mask1_maskaz_BvAxiH_gawO': {
    dev: "मस्क् (मस्कँ) गतौ भ्वादिः",
    rom: "mask (maskaṁ) gatau bhvādiḥ"
  },
  'masj1_tumasjoz_wuxAxiH_SuxXO': {
    dev: "मस्ज् (टुमस्जोँ) शुद्धौ तुदादिः",
    rom: "masj (ṭumasjoṁ) śuddhau tudādiḥ"
  },
  'maha1_maha_curAxiH_pUjAyAm': {
    dev: "मह (मह) पूजायाम् चुरादिः",
    rom: "maha (maha) pūjāyām curādiḥ"
  },
  'mah1_mahaz_BvAxiH_pUjAyAm': {
    dev: "मह् (महँ) पूजायाम् भ्वादिः",
    rom: "mah (mahaṁ) pūjāyām bhvādiḥ"
  },
  'mah3_mahiz_curAxiH_BARArWe': {
    dev: "मह् (महिँ) भाषार्थे चुरादिः",
    rom: "mah (mahiṁ) bhāṣārthe curādiḥ"
  },
  'mah3_mahiz_curAxiH_BAsArWe': {
    dev: "मह् (महिँ) भासार्थे चुरादिः",
    rom: "mah (mahiṁ) bhāsārthe curādiḥ"
  },
  'mah2_mahiz_BvAxiH_vqxXO': {
    dev: "मह् (महिँ) वृद्धौ भ्वादिः",
    rom: "mah (mahiṁ) vṛddhau bhvādiḥ"
  },
  'mA1_mA_axAxiH_mAne': {
    dev: "मा (मा) माने अदादिः",
    rom: "mā (mā) māne adādiḥ"
  },
  'mA2_mAf_juhowyAxiH_mAne': {
    dev: "मा (माङ्) माने जुहोत्यादिः",
    rom: "mā (māṅ) māne juhotyādiḥ"
  },
  'mA3_mAf_xivAxiH_mAne': {
    dev: "मा (माङ्) माने दिवादिः",
    rom: "mā (māṅ) māne divādiḥ"
  },
  'mA2_mAf_juhowyAxiH_Sabxe': {
    dev: "मा (माङ्) शब्दे जुहोत्यादिः",
    rom: "mā (māṅ) śabde juhotyādiḥ"
  },
  'mAkR1_mAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "माक्ष् (माक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "mākṣ (mākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'mAn2_mAnaz_curAxiH_pUjAyAm': {
    dev: "मान् (मानँ) पूजायाम् चुरादिः",
    rom: "mān (mānaṁ) pūjāyām curādiḥ"
  },
  'mAn1_mAnaz_BvAxiH_pUjAyAm': {
    dev: "मान् (मानँ) पूजायाम् भ्वादिः",
    rom: "mān (mānaṁ) pūjāyām bhvādiḥ"
  },
  'mArg1_mArgaz_curAxiH_anveRaNe': {
    dev: "मार्ग् (मार्गँ) अन्वेषणे चुरादिः",
    rom: "mārg (mārgaṁ) anveṣaṇe curādiḥ"
  },
  'mArj1_mArjaz_curAxiH_Sabxe': {
    dev: "मार्ज् (मार्जँ) शब्दे चुरादिः",
    rom: "mārj (mārjaṁ) śabde curādiḥ"
  },
  'mAh2_mAhaz_BvAxiH_mAne': {
    dev: "माह् (माहँ) माने भ्वादिः",
    rom: "māh (māhaṁ) māne bhvādiḥ"
  },
  'mAh1_mAhqz_BvAxiH_mAne': {
    dev: "माह् (माहृँ) माने भ्वादिः",
    rom: "māh (māhṛṁ) māne bhvādiḥ"
  },
  'mi1_dumiF_svAxiH_prakRepaNe': {
    dev: "मि (डुमिञ्) प्रक्षेपणे स्वादिः",
    rom: "mi (ḍumiñ) prakṣepaṇe svādiḥ"
  },
  'miC1_miCaz_wuxAxiH_uwkleSe': {
    dev: "मिछ् (मिछँ) उत्क्लेशे तुदादिः",
    rom: "mich (michaṁ) utkleśe tudādiḥ"
  },
  'mij1_mijiz_curAxiH_BARArWe': {
    dev: "मिज् (मिजिँ) भाषार्थे चुरादिः",
    rom: "mij (mijiṁ) bhāṣārthe curādiḥ"
  },
  'miW1_miWqz_BvAxiH_meXAyAm': {
    dev: "मिथ् (मिथृँ) मेधायाम् भ्वादिः",
    rom: "mith (mithṛṁ) medhāyām bhvādiḥ"
  },
  'miW1_miWqz_BvAxiH_hiMsAyAm': {
    dev: "मिथ् (मिथृँ) हिंसायाम् भ्वादिः",
    rom: "mith (mithṛṁ) hiṃsāyām bhvādiḥ"
  },
  'mix3_FimixAz_xivAxiH_snehane': {
    dev: "मिद् (ञिमिदाँ) स्नेहने दिवादिः",
    rom: "mid (ñimidāṁ) snehane divādiḥ"
  },
  'mix2_FimixAz_BvAxiH_snehane': {
    dev: "मिद् (ञिमिदाँ) स्नेहने भ्वादिः",
    rom: "mid (ñimidāṁ) snehane bhvādiḥ"
  },
  'mix4_mixiz_curAxiH_snehane': {
    dev: "मिद् (मिदिँ) स्नेहने चुरादिः",
    rom: "mid (midiṁ) snehane curādiḥ"
  },
  'mix1_mixqz_BvAxiH_meXAyAm': {
    dev: "मिद् (मिदृँ) मेधायाम् भ्वादिः",
    rom: "mid (midṛṁ) medhāyām bhvādiḥ"
  },
  'mix1_mixqz_BvAxiH_hiMsAyAm': {
    dev: "मिद् (मिदृँ) हिंसायाम् भ्वादिः",
    rom: "mid (midṛṁ) hiṃsāyām bhvādiḥ"
  },
  'mil1_milaz_wuxAxiH_SleRaNe': {
    dev: "मिल् (मिलँ) श्लेषणे तुदादिः",
    rom: "mil (milaṁ) śleṣaṇe tudādiḥ"
  },
  'mil2_milaz_wuxAxiH_safgame': {
    dev: "मिल् (मिलँ) सङ्गमे तुदादिः",
    rom: "mil (milaṁ) saṅgame tudādiḥ"
  },
  'miv1_miviz_BvAxiH_secane': {
    dev: "मिव् (मिविँ) सेचने भ्वादिः",
    rom: "miv (miviṁ) secane bhvādiḥ"
  },
  'miv1_miviz_BvAxiH_sevane': {
    dev: "मिव् (मिविँ) सेवने भ्वादिः",
    rom: "miv (miviṁ) sevane bhvādiḥ"
  },
  'miv1_miviz_BvAxiH_sraMsane': {
    dev: "मिव् (मिविँ) स्रंसने भ्वादिः",
    rom: "miv (miviṁ) sraṃsane bhvādiḥ"
  },
  'miS1_miSaz_BvAxiH_roRe': {
    dev: "मिश् (मिशँ) रोषे भ्वादिः",
    rom: "miś (miśaṁ) roṣe bhvādiḥ"
  },
  'miS1_miSaz_BvAxiH_Sabxe': {
    dev: "मिश् (मिशँ) शब्दे भ्वादिः",
    rom: "miś (miśaṁ) śabde bhvādiḥ"
  },
  'miS1_miSaz_BvAxiH_samAXO': {
    dev: "मिश् (मिशँ) समाधौ भ्वादिः",
    rom: "miś (miśaṁ) samādhau bhvādiḥ"
  },
  'miSra1_miSra_curAxiH_samparke': {
    dev: "मिश्र (मिश्र) सम्पर्के चुरादिः",
    rom: "miśra (miśra) samparke curādiḥ"
  },
  'miSra1_miSra_curAxiH_samparcane': {
    dev: "मिश्र (मिश्र) सम्पर्चने चुरादिः",
    rom: "miśra (miśra) samparcane curādiḥ"
  },
  'miR2_miRaz_wuxAxiH_sparXAyAm': {
    dev: "मिष् (मिषँ) स्पर्धायाम् तुदादिः",
    rom: "miṣ (miṣaṁ) spardhāyām tudādiḥ"
  },
  'miR1_miRuz_BvAxiH_secane': {
    dev: "मिष् (मिषुँ) सेचने भ्वादिः",
    rom: "miṣ (miṣuṁ) secane bhvādiḥ"
  },
  'miR1_miRuz_BvAxiH_sevane': {
    dev: "मिष् (मिषुँ) सेवने भ्वादिः",
    rom: "miṣ (miṣuṁ) sevane bhvādiḥ"
  },
  'mih1_mihaz_BvAxiH_secane': {
    dev: "मिह् (मिहँ) सेचने भ्वादिः",
    rom: "mih (mihaṁ) secane bhvādiḥ"
  },
  'mI3_mI_curAxiH_gawO': {
    dev: "मी (मी) गतौ चुरादिः",
    rom: "mī (mī) gatau curādiḥ"
  },
  'mI3_mI_curAxiH_manane': {
    dev: "मी (मी) मनने चुरादिः",
    rom: "mī (mī) manane curādiḥ"
  },
  'mI1_mIf_xivAxiH_hiMsAyAm': {
    dev: "मी (मीङ्) हिंसायाम् दिवादिः",
    rom: "mī (mīṅ) hiṃsāyām divādiḥ"
  },
  'mI2_mIF_kryAxiH_hiMsAyAm': {
    dev: "मी (मीञ्) हिंसायाम् क्र्यादिः",
    rom: "mī (mīñ) hiṃsāyām kryādiḥ"
  },
  'mIm1_mImqz_BvAxiH_gawO': {
    dev: "मीम् (मीमृँ) गतौ भ्वादिः",
    rom: "mīm (mīmṛṁ) gatau bhvādiḥ"
  },
  'mIm1_mImqz_BvAxiH_Sabxe': {
    dev: "मीम् (मीमृँ) शब्दे भ्वादिः",
    rom: "mīm (mīmṛṁ) śabde bhvādiḥ"
  },
  'mIl1_mIlaz_BvAxiH_nimeRaNe': {
    dev: "मील् (मीलँ) निमेषणे भ्वादिः",
    rom: "mīl (mīlaṁ) nimeṣaṇe bhvādiḥ"
  },
  'mIv1_mIvaz_BvAxiH_sWOlye': {
    dev: "मीव् (मीवँ) स्थौल्ये भ्वादिः",
    rom: "mīv (mīvaṁ) sthaulye bhvādiḥ"
  },
  'muc3_mucaz_curAxiH_pramocane': {
    dev: "मुच् (मुचँ) प्रमोचने चुरादिः",
    rom: "muc (mucaṁ) pramocane curādiḥ"
  },
  'muc3_mucaz_curAxiH_moxane': {
    dev: "मुच् (मुचँ) मोदने चुरादिः",
    rom: "muc (mucaṁ) modane curādiḥ"
  },
  'muc1_muciz_BvAxiH_kalkane': {
    dev: "मुच् (मुचिँ) कल्कने भ्वादिः",
    rom: "muc (muciṁ) kalkane bhvādiḥ"
  },
  'muc2_mucLz_wuxAxiH_mokRaNe': {
    dev: "मुच् (मुचॢँ) मोक्षणे तुदादिः",
    rom: "muc (mucḷṁ) mokṣaṇe tudādiḥ"
  },
  'muj1_mujaz_BvAxiH_Sabxe': {
    dev: "मुज् (मुजँ) शब्दे भ्वादिः",
    rom: "muj (mujaṁ) śabde bhvādiḥ"
  },
  'muj2_mujiz_BvAxiH_Sabxe': {
    dev: "मुज् (मुजिँ) शब्दे भ्वादिः",
    rom: "muj (mujiṁ) śabde bhvādiḥ"
  },
  'mut2_mutaz_wuxAxiH_AkRepe': {
    dev: "मुट् (मुटँ) आक्षेपे तुदादिः",
    rom: "muṭ (muṭaṁ) ākṣepe tudādiḥ"
  },
  'mut2_mutaz_wuxAxiH_pramarxane': {
    dev: "मुट् (मुटँ) प्रमर्दने तुदादिः",
    rom: "muṭ (muṭaṁ) pramardane tudādiḥ"
  },
  'mut1_mutaz_BvAxiH_pramarxane': {
    dev: "मुट् (मुटँ) प्रमर्दने भ्वादिः",
    rom: "muṭ (muṭaṁ) pramardane bhvādiḥ"
  },
  'mut3_mutaz_curAxiH_saFcUrNane': {
    dev: "मुट् (मुटँ) सञ्चूर्णने चुरादिः",
    rom: "muṭ (muṭaṁ) sañcūrṇane curādiḥ"
  },
  'muT1_muTiz_BvAxiH_palAyane': {
    dev: "मुठ् (मुठिँ) पलायने भ्वादिः",
    rom: "muṭh (muṭhiṁ) palāyane bhvādiḥ"
  },
  'muT1_muTiz_BvAxiH_pAlane': {
    dev: "मुठ् (मुठिँ) पालने भ्वादिः",
    rom: "muṭh (muṭhiṁ) pālane bhvādiḥ"
  },
  'mud2_mudiz_BvAxiH_KaNdane': {
    dev: "मुड् (मुडिँ) खण्डने भ्वादिः",
    rom: "muḍ (muḍiṁ) khaṇḍane bhvādiḥ"
  },
  'mud2_mudiz_BvAxiH_pramarxane': {
    dev: "मुड् (मुडिँ) प्रमर्दने भ्वादिः",
    rom: "muḍ (muḍiṁ) pramardane bhvādiḥ"
  },
  'mud1_mudiz_BvAxiH_majjane': {
    dev: "मुड् (मुडिँ) मज्जने भ्वादिः",
    rom: "muḍ (muḍiṁ) majjane bhvādiḥ"
  },
  'mud1_mudiz_BvAxiH_mArjane': {
    dev: "मुड् (मुडिँ) मार्जने भ्वादिः",
    rom: "muḍ (muḍiṁ) mārjane bhvādiḥ"
  },
  'muN1_muNaz_wuxAxiH_prawijFAne': {
    dev: "मुण् (मुणँ) प्रतिज्ञाने तुदादिः",
    rom: "muṇ (muṇaṁ) pratijñāne tudādiḥ"
  },
  'mux2_muxaz_curAxiH_saMsarge': {
    dev: "मुद् (मुदँ) संसर्गे चुरादिः",
    rom: "mud (mudaṁ) saṃsarge curādiḥ"
  },
  'mux1_muxaz_BvAxiH_harRe': {
    dev: "मुद् (मुदँ) हर्षे भ्वादिः",
    rom: "mud (mudaṁ) harṣe bhvādiḥ"
  },
  'mur1_muraz_wuxAxiH_saMveRtane': {
    dev: "मुर् (मुरँ) संवेष्टने तुदादिः",
    rom: "mur (muraṁ) saṃveṣṭane tudādiḥ"
  },
  'murC1_murCAz_BvAxiH_mohane': {
    dev: "मुर्छ् (मुर्छाँ) मोहने भ्वादिः",
    rom: "murch (murchāṁ) mohane bhvādiḥ"
  },
  'murC1_murCAz_BvAxiH_samucCrAye': {
    dev: "मुर्छ् (मुर्छाँ) समुच्छ्राये भ्वादिः",
    rom: "murch (murchāṁ) samucchrāye bhvādiḥ"
  },
  'murv1_murvIz_BvAxiH_banXane': {
    dev: "मुर्व् (मुर्वीँ) बन्धने भ्वादिः",
    rom: "murv (murvīṁ) bandhane bhvādiḥ"
  },
  'muR2_muRaz_kryAxiH_sweye': {
    dev: "मुष् (मुषँ) स्तेये क्र्यादिः",
    rom: "muṣ (muṣaṁ) steye kryādiḥ"
  },
  'muR1_muRaz_BvAxiH_hiMsAyAm': {
    dev: "मुष् (मुषँ) हिंसायाम् भ्वादिः",
    rom: "muṣ (muṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'mus1_musaz_xivAxiH_KaNdane': {
    dev: "मुस् (मुसँ) खण्डने दिवादिः",
    rom: "mus (musaṁ) khaṇḍane divādiḥ"
  },
  'musw1_muswaz_curAxiH_safGAwe': {
    dev: "मुस्त् (मुस्तँ) सङ्घाते चुरादिः",
    rom: "must (mustaṁ) saṅghāte curādiḥ"
  },
  'muh1_muhaz_xivAxiH_vEciwye': {
    dev: "मुह् (मुहँ) वैचित्ये दिवादिः",
    rom: "muh (muhaṁ) vaicitye divādiḥ"
  },
  'mU1_mUf_BvAxiH_banXane': {
    dev: "मू (मूङ्) बन्धने भ्वादिः",
    rom: "mū (mūṅ) bandhane bhvādiḥ"
  },
  'mUwra1_mUwra_curAxiH_prasravaNe': {
    dev: "मूत्र (मूत्र) प्रस्रवणे चुरादिः",
    rom: "mūtra (mūtra) prasravaṇe curādiḥ"
  },
  'mUl1_mUlaz_BvAxiH_prawiRTAyAm': {
    dev: "मूल् (मूलँ) प्रतिष्ठायाम् भ्वादिः",
    rom: "mūl (mūlaṁ) pratiṣṭhāyām bhvādiḥ"
  },
  'mUl2_mUlaz_curAxiH_rohaNe': {
    dev: "मूल् (मूलँ) रोहणे चुरादिः",
    rom: "mūl (mūlaṁ) rohaṇe curādiḥ"
  },
  'mUR1_mURaz_BvAxiH_sweye': {
    dev: "मूष् (मूषँ) स्तेये भ्वादिः",
    rom: "mūṣ (mūṣaṁ) steye bhvādiḥ"
  },
  'mq1_mqf_wuxAxiH_prANawyAge': {
    dev: "मृ (मृङ्) प्राणत्यागे तुदादिः",
    rom: "mṛ (mṛṅ) prāṇatyāge tudādiḥ"
  },
  'mqkR1_mqkRaz_BvAxiH_safGAwe': {
    dev: "मृक्ष् (मृक्षँ) सङ्घाते भ्वादिः",
    rom: "mṛkṣ (mṛkṣaṁ) saṅghāte bhvādiḥ"
  },
  'mqga1_mqga_curAxiH_anveRaNe': {
    dev: "मृग (मृग) अन्वेषणे चुरादिः",
    rom: "mṛga (mṛga) anveṣaṇe curādiḥ"
  },
  'mqj2_mqjUz_curAxiH_alafkAre': {
    dev: "मृज् (मृजूँ) अलङ्कारे चुरादिः",
    rom: "mṛj (mṛjūṁ) alaṅkāre curādiḥ"
  },
  'mqj2_mqjUz_curAxiH_SOce': {
    dev: "मृज् (मृजूँ) शौचे चुरादिः",
    rom: "mṛj (mṛjūṁ) śauce curādiḥ"
  },
  'mqj1_mqjUzR_axAxiH_SuxXO': {
    dev: "मृज् (मृजूँष्) शुद्धौ अदादिः",
    rom: "mṛj (mṛjūṁṣ) śuddhau adādiḥ"
  },
  'mqd2_mqdaz_kryAxiH_kRoxe': {
    dev: "मृड् (मृडँ) क्षोदे क्र्यादिः",
    rom: "mṛḍ (mṛḍaṁ) kṣode kryādiḥ"
  },
  'mqd2_mqdaz_kryAxiH_suKe': {
    dev: "मृड् (मृडँ) सुखे क्र्यादिः",
    rom: "mṛḍ (mṛḍaṁ) sukhe kryādiḥ"
  },
  'mqd1_mqdaz_wuxAxiH_suKe': {
    dev: "मृड् (मृडँ) सुखे तुदादिः",
    rom: "mṛḍ (mṛḍaṁ) sukhe tudādiḥ"
  },
  'mqN1_mqNaz_wuxAxiH_hiMsAyAm': {
    dev: "मृण् (मृणँ) हिंसायाम् तुदादिः",
    rom: "mṛṇ (mṛṇaṁ) hiṃsāyām tudādiḥ"
  },
  'mqx1_mqxaz_kryAxiH_kRoxe': {
    dev: "मृद् (मृदँ) क्षोदे क्र्यादिः",
    rom: "mṛd (mṛdaṁ) kṣode kryādiḥ"
  },
  'mqX1_mqXuz_BvAxiH_unxe': {
    dev: "मृध् (मृधुँ) उन्दे भ्वादिः",
    rom: "mṛdh (mṛdhuṁ) unde bhvādiḥ"
  },
  'mqX2_mqXqz_BvAxiH_unxe': {
    dev: "मृध् (मृधृँ) उन्दे भ्वादिः",
    rom: "mṛdh (mṛdhṛṁ) unde bhvādiḥ"
  },
  'mqS1_mqSaz_wuxAxiH_AmarSane': {
    dev: "मृश् (मृशँ) आमर्शने तुदादिः",
    rom: "mṛś (mṛśaṁ) āmarśane tudādiḥ"
  },
  'mqR3_mqRaz_curAxiH_wiwikRAyAm': {
    dev: "मृष् (मृषँ) तितिक्षायाम् चुरादिः",
    rom: "mṛṣ (mṛṣaṁ) titikṣāyām curādiḥ"
  },
  'mqR2_mqRaz_xivAxiH_wiwikRAyAm': {
    dev: "मृष् (मृषँ) तितिक्षायाम् दिवादिः",
    rom: "mṛṣ (mṛṣaṁ) titikṣāyām divādiḥ"
  },
  'mqR1_mqRuz_BvAxiH_sahane': {
    dev: "मृष् (मृषुँ) सहने भ्वादिः",
    rom: "mṛṣ (mṛṣuṁ) sahane bhvādiḥ"
  },
  'mqR1_mqRuz_BvAxiH_secane': {
    dev: "मृष् (मृषुँ) सेचने भ्वादिः",
    rom: "mṛṣ (mṛṣuṁ) secane bhvādiḥ"
  },
  'mQ1_mQ_kryAxiH_hiMsAyAm': {
    dev: "मॄ (मॄ) हिंसायाम् क्र्यादिः",
    rom: "mṝ (mṝ) hiṃsāyām kryādiḥ"
  },
  'me1_mef_BvAxiH_praNixAne': {
    dev: "मे (मेङ्) प्रणिदाने भ्वादिः",
    rom: "me (meṅ) praṇidāne bhvādiḥ"
  },
  'met1_metqz_BvAxiH_unmAxe': {
    dev: "मेट् (मेटृँ) उन्मादे भ्वादिः",
    rom: "meṭ (meṭṛṁ) unmāde bhvādiḥ"
  },
  'meW1_meWqz_BvAxiH_meXAyAm': {
    dev: "मेथ् (मेथृँ) मेधायाम् भ्वादिः",
    rom: "meth (methṛṁ) medhāyām bhvādiḥ"
  },
  'meW1_meWqz_BvAxiH_hiMsAyAm': {
    dev: "मेथ् (मेथृँ) हिंसायाम् भ्वादिः",
    rom: "meth (methṛṁ) hiṃsāyām bhvādiḥ"
  },
  'mex1_mexqz_BvAxiH_meXAyAm': {
    dev: "मेद् (मेदृँ) मेधायाम् भ्वादिः",
    rom: "med (medṛṁ) medhāyām bhvādiḥ"
  },
  'mex1_mexqz_BvAxiH_hiMsAyAm': {
    dev: "मेद् (मेदृँ) हिंसायाम् भ्वादिः",
    rom: "med (medṛṁ) hiṃsāyām bhvādiḥ"
  },
  'meX1_meXqz_BvAxiH_meXAyAm': {
    dev: "मेध् (मेधृँ) मेधायाम् भ्वादिः",
    rom: "medh (medhṛṁ) medhāyām bhvādiḥ"
  },
  'meX1_meXqz_BvAxiH_safgame': {
    dev: "मेध् (मेधृँ) सङ्गमे भ्वादिः",
    rom: "medh (medhṛṁ) saṅgame bhvādiḥ"
  },
  'meX1_meXqz_BvAxiH_hiMsAyAm': {
    dev: "मेध् (मेधृँ) हिंसायाम् भ्वादिः",
    rom: "medh (medhṛṁ) hiṃsāyām bhvādiḥ"
  },
  'mep1_mepqz_BvAxiH_gawO': {
    dev: "मेप् (मेपृँ) गतौ भ्वादिः",
    rom: "mep (mepṛṁ) gatau bhvādiḥ"
  },
  'mev1_mevqz_BvAxiH_secane': {
    dev: "मेव् (मेवृँ) सेचने भ्वादिः",
    rom: "mev (mevṛṁ) secane bhvādiḥ"
  },
  'mev1_mevqz_BvAxiH_sevane': {
    dev: "मेव् (मेवृँ) सेवने भ्वादिः",
    rom: "mev (mevṛṁ) sevane bhvādiḥ"
  },
  'mokR1_mokRaz_curAxiH_asane': {
    dev: "मोक्ष् (मोक्षँ) असने चुरादिः",
    rom: "mokṣ (mokṣaṁ) asane curādiḥ"
  },
  'mnA1_mnA_BvAxiH_aByAse': {
    dev: "म्ना (म्ना) अभ्यासे भ्वादिः",
    rom: "mnā (mnā) abhyāse bhvādiḥ"
  },
  'mrakR2_mrakRaz_curAxiH_mrakRaNe': {
    dev: "म्रक्ष् (म्रक्षँ) म्रक्षणे चुरादिः",
    rom: "mrakṣ (mrakṣaṁ) mrakṣaṇe curādiḥ"
  },
  'mrakR2_mrakRaz_curAxiH_mlecCane': {
    dev: "म्रक्ष् (म्रक्षँ) म्लेच्छने चुरादिः",
    rom: "mrakṣ (mrakṣaṁ) mlecchane curādiḥ"
  },
  'mrakR1_mrakRaz_BvAxiH_safGAwe': {
    dev: "म्रक्ष् (म्रक्षँ) सङ्घाते भ्वादिः",
    rom: "mrakṣ (mrakṣaṁ) saṅghāte bhvādiḥ"
  },
  'mrax1_mraxaz_BvAxiH_marxane': {
    dev: "म्रद् (म्रदँ) मर्दने भ्वादिः",
    rom: "mrad (mradaṁ) mardane bhvādiḥ"
  },
  'mruc1_mrucuz_BvAxiH_gawO': {
    dev: "म्रुच् (म्रुचुँ) गतौ भ्वादिः",
    rom: "mruc (mrucuṁ) gatau bhvādiḥ"
  },
  'mrunc1_mruncuz_BvAxiH_gawO': {
    dev: "म्रुन्च् (म्रुन्चुँ) गतौ भ्वादिः",
    rom: "mrunc (mruncuṁ) gatau bhvādiḥ"
  },
  'mret1_mretqz_BvAxiH_unmAxe': {
    dev: "म्रेट् (म्रेटृँ) उन्मादे भ्वादिः",
    rom: "mreṭ (mreṭṛṁ) unmāde bhvādiḥ"
  },
  'mluc1_mlucuz_BvAxiH_gawO': {
    dev: "म्लुच् (म्लुचुँ) गतौ भ्वादिः",
    rom: "mluc (mlucuṁ) gatau bhvādiḥ"
  },
  'mlunc1_mluncuz_BvAxiH_gawO': {
    dev: "म्लुन्च् (म्लुन्चुँ) गतौ भ्वादिः",
    rom: "mlunc (mluncuṁ) gatau bhvādiḥ"
  },
  'mleC2_mleCaz_curAxiH_avyakwAyAM_vAci': {
    dev: "म्लेछ् (म्लेछँ) अव्यक्तायां_वाचि चुरादिः",
    rom: "mlech (mlechaṁ) avyaktāyāṃ_vāci curādiḥ"
  },
  'mleC1_mleCaz_BvAxiH_avyakwAyAM_vAci': {
    dev: "म्लेछ् (म्लेछँ) अव्यक्तायां_वाचि भ्वादिः",
    rom: "mlech (mlechaṁ) avyaktāyāṃ_vāci bhvādiḥ"
  },
  'mleC1_mleCaz_BvAxiH_avyakwe_Sabxe': {
    dev: "म्लेछ् (म्लेछँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "mlech (mlechaṁ) avyakte_śabde bhvādiḥ"
  },
  'mlet1_mletqz_BvAxiH_unmAxe': {
    dev: "म्लेट् (म्लेटृँ) उन्मादे भ्वादिः",
    rom: "mleṭ (mleṭṛṁ) unmāde bhvādiḥ"
  },
  'mled1_mledqz_BvAxiH_unmAxe': {
    dev: "म्लेड् (म्लेडृँ) उन्मादे भ्वादिः",
    rom: "mleḍ (mleḍṛṁ) unmāde bhvādiḥ"
  },
  'mlev1_mlevqz_BvAxiH_secane': {
    dev: "म्लेव् (म्लेवृँ) सेचने भ्वादिः",
    rom: "mlev (mlevṛṁ) secane bhvādiḥ"
  },
  'mlev1_mlevqz_BvAxiH_sevane': {
    dev: "म्लेव् (म्लेवृँ) सेवने भ्वादिः",
    rom: "mlev (mlevṛṁ) sevane bhvādiḥ"
  },
  'mlE1_mlE_BvAxiH_gAwravinAme': {
    dev: "म्लै (म्लै) गात्रविनामे भ्वादिः",
    rom: "mlai (mlai) gātravināme bhvādiḥ"
  },
  'mlE1_mlE_BvAxiH_harRakRaye': {
    dev: "म्लै (म्लै) हर्षक्षये भ्वादिः",
    rom: "mlai (mlai) harṣakṣaye bhvādiḥ"
  },
  'yakR1_yakRaz_curAxiH_pUjAyAm': {
    dev: "यक्ष् (यक्षँ) पूजायाम् चुरादिः",
    rom: "yakṣ (yakṣaṁ) pūjāyām curādiḥ"
  },
  'yaj1_yajaz_BvAxiH_xAne': {
    dev: "यज् (यजँ) दाने भ्वादिः",
    rom: "yaj (yajaṁ) dāne bhvādiḥ"
  },
  'yaj1_yajaz_BvAxiH_xevapUjAyAm': {
    dev: "यज् (यजँ) देवपूजायाम् भ्वादिः",
    rom: "yaj (yajaṁ) devapūjāyām bhvādiḥ"
  },
  'yaj1_yajaz_BvAxiH_safgawikaraNe': {
    dev: "यज् (यजँ) सङ्गतिकरणे भ्वादिः",
    rom: "yaj (yajaṁ) saṅgatikaraṇe bhvādiḥ"
  },
  'yaw2_yawaz_curAxiH_upaskAre': {
    dev: "यत् (यतँ) उपस्कारे चुरादिः",
    rom: "yat (yataṁ) upaskāre curādiḥ"
  },
  'yaw2_yawaz_curAxiH_nikAre': {
    dev: "यत् (यतँ) निकारे चुरादिः",
    rom: "yat (yataṁ) nikāre curādiḥ"
  },
  'yaw1_yawIz_BvAxiH_prayawne': {
    dev: "यत् (यतीँ) प्रयत्ने भ्वादिः",
    rom: "yat (yatīṁ) prayatne bhvādiḥ"
  },
  'yawr1_yawriz_curAxiH_safkocane': {
    dev: "यत्र् (यत्रिँ) सङ्कोचने चुरादिः",
    rom: "yatr (yatriṁ) saṅkocane curādiḥ"
  },
  'yaB1_yaBaz_BvAxiH_viparIwamEWune': {
    dev: "यभ् (यभँ) विपरीतमैथुने भ्वादिः",
    rom: "yabh (yabhaṁ) viparītamaithune bhvādiḥ"
  },
  'yam2_yamaz_BvAxiH_uparame': {
    dev: "यम् (यमँ) उपरमे भ्वादिः",
    rom: "yam (yamaṁ) uparame bhvādiḥ"
  },
  'yam3_yamaz_curAxiH_pariveRaNe': {
    dev: "यम् (यमँ) परिवेषणे चुरादिः",
    rom: "yam (yamaṁ) pariveṣaṇe curādiḥ"
  },
  'yam1_yamuz_BvAxiH_uparame': {
    dev: "यम् (यमुँ) उपरमे भ्वादिः",
    rom: "yam (yamuṁ) uparame bhvādiḥ"
  },
  'yay1_yayaz_BvAxiH_gawO': {
    dev: "यय् (ययँ) गतौ भ्वादिः",
    rom: "yay (yayaṁ) gatau bhvādiḥ"
  },
  'yas1_yasuz_xivAxiH_prayawne': {
    dev: "यस् (यसुँ) प्रयत्ने दिवादिः",
    rom: "yas (yasuṁ) prayatne divādiḥ"
  },
  'yas1_yasuz_xivAxiH_yawne': {
    dev: "यस् (यसुँ) यत्ने दिवादिः",
    rom: "yas (yasuṁ) yatne divādiḥ"
  },
  'yA1_yA_axAxiH_prApaNe': {
    dev: "या (या) प्रापणे अदादिः",
    rom: "yā (yā) prāpaṇe adādiḥ"
  },
  'yAc1_tuyAcqz_BvAxiH_yAFcAyAm': {
    dev: "याच् (टुयाचृँ) याञ्चायाम् भ्वादिः",
    rom: "yāc (ṭuyācṛṁ) yāñcāyām bhvādiḥ"
  },
  'yAc2_duyAcqz_BvAxiH_yAFcAyAm': {
    dev: "याच् (डुयाचृँ) याञ्चायाम् भ्वादिः",
    rom: "yāc (ḍuyācṛṁ) yāñcāyām bhvādiḥ"
  },
  'yu3_yu_curAxiH_jugupsAyAm': {
    dev: "यु (यु) जुगुप्सायाम् चुरादिः",
    rom: "yu (yu) jugupsāyām curādiḥ"
  },
  'yu1_yu_axAxiH_miSraNe': {
    dev: "यु (यु) मिश्रणे अदादिः",
    rom: "yu (yu) miśraṇe adādiḥ"
  },
  'yu2_yuF_kryAxiH_banXane': {
    dev: "यु (युञ्) बन्धने क्र्यादिः",
    rom: "yu (yuñ) bandhane kryādiḥ"
  },
  'yug1_yugiz_BvAxiH_varjane': {
    dev: "युग् (युगिँ) वर्जने भ्वादिः",
    rom: "yug (yugiṁ) varjane bhvādiḥ"
  },
  'yuC1_yuCaz_BvAxiH_pramAxe': {
    dev: "युछ् (युछँ) प्रमादे भ्वादिः",
    rom: "yuch (yuchaṁ) pramāde bhvādiḥ"
  },
  'yuj3_yujaz_curAxiH_saMyamane': {
    dev: "युज् (युजँ) संयमने चुरादिः",
    rom: "yuj (yujaṁ) saṃyamane curādiḥ"
  },
  'yuj1_yujaz_xivAxiH_samAXO': {
    dev: "युज् (युजँ) समाधौ दिवादिः",
    rom: "yuj (yujaṁ) samādhau divādiḥ"
  },
  'yuj3_yujaz_curAxiH_samparcane': {
    dev: "युज् (युजँ) सम्पर्चने चुरादिः",
    rom: "yuj (yujaṁ) samparcane curādiḥ"
  },
  'yuj2_yujizr_ruXAxiH_yoge': {
    dev: "युज् (युजिँर्) योगे रुधादिः",
    rom: "yuj (yujiṁr) yoge rudhādiḥ"
  },
  'yuw1_yuwqz_BvAxiH_BAsane': {
    dev: "युत् (युतृँ) भासने भ्वादिः",
    rom: "yut (yutṛṁ) bhāsane bhvādiḥ"
  },
  'yuX1_yuXaz_xivAxiH_samprahAre': {
    dev: "युध् (युधँ) सम्प्रहारे दिवादिः",
    rom: "yudh (yudhaṁ) samprahāre divādiḥ"
  },
  'yup1_yupaz_xivAxiH_vimohane': {
    dev: "युप् (युपँ) विमोहने दिवादिः",
    rom: "yup (yupaṁ) vimohane divādiḥ"
  },
  'yUR1_yURaz_BvAxiH_hiMsAyAm': {
    dev: "यूष् (यूषँ) हिंसायाम् भ्वादिः",
    rom: "yūṣ (yūṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'yeR1_yeRqz_BvAxiH_prayawne': {
    dev: "येष् (येषृँ) प्रयत्ने भ्वादिः",
    rom: "yeṣ (yeṣṛṁ) prayatne bhvādiḥ"
  },
  'yOt1_yOtqz_BvAxiH_banXane': {
    dev: "यौट् (यौटृँ) बन्धने भ्वादिः",
    rom: "yauṭ (yauṭṛṁ) bandhane bhvādiḥ"
  },
  'rak1_rakaz_curAxiH_AsvAxane': {
    dev: "रक् (रकँ) आस्वादने चुरादिः",
    rom: "rak (rakaṁ) āsvādane curādiḥ"
  },
  'rakR1_rakRaz_BvAxiH_pAlane': {
    dev: "रक्ष् (रक्षँ) पालने भ्वादिः",
    rom: "rakṣ (rakṣaṁ) pālane bhvādiḥ"
  },
  'raK1_raKaz_BvAxiH_gawO': {
    dev: "रख् (रखँ) गतौ भ्वादिः",
    rom: "rakh (rakhaṁ) gatau bhvādiḥ"
  },
  'raK2_raKiz_BvAxiH_gawO': {
    dev: "रख् (रखिँ) गतौ भ्वादिः",
    rom: "rakh (rakhiṁ) gatau bhvādiḥ"
  },
  'rag3_ragaz_curAxiH_AsvAxane': {
    dev: "रग् (रगँ) आस्वादने चुरादिः",
    rom: "rag (ragaṁ) āsvādane curādiḥ"
  },
  'rag1_ragiz_BvAxiH_gawO': {
    dev: "रग् (रगिँ) गतौ भ्वादिः",
    rom: "rag (ragiṁ) gatau bhvādiḥ"
  },
  'rag2_ragez_BvAxiH_SafkAyAm': {
    dev: "रग् (रगेँ) शङ्कायाम् भ्वादिः",
    rom: "rag (rageṁ) śaṅkāyām bhvādiḥ"
  },
  'raG1_raGiz_BvAxiH_gawO': {
    dev: "रघ् (रघिँ) गतौ भ्वादिः",
    rom: "ragh (raghiṁ) gatau bhvādiḥ"
  },
  'raG2_raGiz_curAxiH_BARArWe': {
    dev: "रघ् (रघिँ) भाषार्थे चुरादिः",
    rom: "ragh (raghiṁ) bhāṣārthe curādiḥ"
  },
  'raG2_raGiz_curAxiH_BAsArWe': {
    dev: "रघ् (रघिँ) भासार्थे चुरादिः",
    rom: "ragh (raghiṁ) bhāsārthe curādiḥ"
  },
  'raca1_raca_curAxiH_prawiyawne': {
    dev: "रच (रच) प्रतियत्ने चुरादिः",
    rom: "raca (raca) pratiyatne curādiḥ"
  },
  'rat1_rataz_BvAxiH_pariBARaNe': {
    dev: "रट् (रटँ) परिभाषणे भ्वादिः",
    rom: "raṭ (raṭaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'raT1_raTaz_BvAxiH_pariBARaNe': {
    dev: "रठ् (रठँ) परिभाषणे भ्वादिः",
    rom: "raṭh (raṭhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'raN1_raNaz_BvAxiH_gawO': {
    dev: "रण् (रणँ) गतौ भ्वादिः",
    rom: "raṇ (raṇaṁ) gatau bhvādiḥ"
  },
  'raN1_raNaz_BvAxiH_Sabxe': {
    dev: "रण् (रणँ) शब्दे भ्वादिः",
    rom: "raṇ (raṇaṁ) śabde bhvādiḥ"
  },
  'rax1_raxaz_BvAxiH_vileKane': {
    dev: "रद् (रदँ) विलेखने भ्वादिः",
    rom: "rad (radaṁ) vilekhane bhvādiḥ"
  },
  'raX1_raXaz_xivAxiH_saMrAxXO': {
    dev: "रध् (रधँ) संराद्धौ दिवादिः",
    rom: "radh (radhaṁ) saṃrāddhau divādiḥ"
  },
  'raX1_raXaz_xivAxiH_hiMsAyAm': {
    dev: "रध् (रधँ) हिंसायाम् दिवादिः",
    rom: "radh (radhaṁ) hiṃsāyām divādiḥ"
  },
  'ranj2_ranjaz_xivAxiH_rAge': {
    dev: "रन्ज् (रन्जँ) रागे दिवादिः",
    rom: "ranj (ranjaṁ) rāge divādiḥ"
  },
  'ranj1_ranjaz_BvAxiH_rAge': {
    dev: "रन्ज् (रन्जँ) रागे भ्वादिः",
    rom: "ranj (ranjaṁ) rāge bhvādiḥ"
  },
  'rap1_rapaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "रप् (रपँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "rap (rapaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'raP1_raPaz_BvAxiH_gawO': {
    dev: "रफ् (रफँ) गतौ भ्वादिः",
    rom: "raph (raphaṁ) gatau bhvādiḥ"
  },
  'raP2_raPiz_BvAxiH_gawO': {
    dev: "रफ् (रफिँ) गतौ भ्वादिः",
    rom: "raph (raphiṁ) gatau bhvādiḥ"
  },
  'rab1_rabiz_BvAxiH_Sabxe': {
    dev: "रब् (रबिँ) शब्दे भ्वादिः",
    rom: "rab (rabiṁ) śabde bhvādiḥ"
  },
  'raB1_raBaz_BvAxiH_rABasye': {
    dev: "रभ् (रभँ) राभस्ये भ्वादिः",
    rom: "rabh (rabhaṁ) rābhasye bhvādiḥ"
  },
  'ram2_ramaz_BvAxiH_krIdAyAm': {
    dev: "रम् (रमँ) क्रीडायाम् भ्वादिः",
    rom: "ram (ramaṁ) krīḍāyām bhvādiḥ"
  },
  'ram1_ramuz_BvAxiH_krIdAyAm': {
    dev: "रम् (रमुँ) क्रीडायाम् भ्वादिः",
    rom: "ram (ramuṁ) krīḍāyām bhvādiḥ"
  },
  'ray1_rayaz_BvAxiH_gawO': {
    dev: "रय् (रयँ) गतौ भ्वादिः",
    rom: "ray (rayaṁ) gatau bhvādiḥ"
  },
  'rarPa1_rarPa_BvAxiH_gawO': {
    dev: "रर्फ (रर्फ) गतौ भ्वादिः",
    rom: "rarpha (rarpha) gatau bhvādiḥ"
  },
  'rav1_raviz_BvAxiH_gawO': {
    dev: "रव् (रविँ) गतौ भ्वादिः",
    rom: "rav (raviṁ) gatau bhvādiḥ"
  },
  'rasa1_rasa_curAxiH_AsvAxane': {
    dev: "रस (रस) आस्वादने चुरादिः",
    rom: "rasa (rasa) āsvādane curādiḥ"
  },
  'rasa1_rasa_curAxiH_snehane': {
    dev: "रस (रस) स्नेहने चुरादिः",
    rom: "rasa (rasa) snehane curādiḥ"
  },
  'ras1_rasaz_BvAxiH_Sabxe': {
    dev: "रस् (रसँ) शब्दे भ्वादिः",
    rom: "ras (rasaṁ) śabde bhvādiḥ"
  },
  'raha1_raha_curAxiH_wyAge': {
    dev: "रह (रह) त्यागे चुरादिः",
    rom: "raha (raha) tyāge curādiḥ"
  },
  'rahi1_rahi_curAxiH_gawO': {
    dev: "रहि (रहि) गतौ चुरादिः",
    rom: "rahi (rahi) gatau curādiḥ"
  },
  'rah4_rahaz_curAxiH_wyAge': {
    dev: "रह् (रहँ) त्यागे चुरादिः",
    rom: "rah (rahaṁ) tyāge curādiḥ"
  },
  'rah2_rahaz_BvAxiH_wyAge': {
    dev: "रह् (रहँ) त्यागे भ्वादिः",
    rom: "rah (rahaṁ) tyāge bhvādiḥ"
  },
  'rah1_rahiz_BvAxiH_gawO': {
    dev: "रह् (रहिँ) गतौ भ्वादिः",
    rom: "rah (rahiṁ) gatau bhvādiḥ"
  },
  'rah3_rahiz_curAxiH_BARArWe': {
    dev: "रह् (रहिँ) भाषार्थे चुरादिः",
    rom: "rah (rahiṁ) bhāṣārthe curādiḥ"
  },
  'rA1_rA_axAxiH_xAne': {
    dev: "रा (रा) दाने अदादिः",
    rom: "rā (rā) dāne adādiḥ"
  },
  'rAK1_rAKqz_BvAxiH_alamarWe': {
    dev: "राख् (राखृँ) अलमर्थे भ्वादिः",
    rom: "rākh (rākhṛṁ) alamarthe bhvādiḥ"
  },
  'rAK1_rAKqz_BvAxiH_SoRaNe': {
    dev: "राख् (राखृँ) शोषणे भ्वादिः",
    rom: "rākh (rākhṛṁ) śoṣaṇe bhvādiḥ"
  },
  'rAG1_rAGqz_BvAxiH_sAmarWye': {
    dev: "राघ् (राघृँ) सामर्थ्ये भ्वादिः",
    rom: "rāgh (rāghṛṁ) sāmarthye bhvādiḥ"
  },
  'rAj1_rAjqz_BvAxiH_xIpwO': {
    dev: "राज् (राजृँ) दीप्तौ भ्वादिः",
    rom: "rāj (rājṛṁ) dīptau bhvādiḥ"
  },
  'rAX2_rAXaz_svAxiH_saMsixXO': {
    dev: "राध् (राधँ) संसिद्धौ स्वादिः",
    rom: "rādh (rādhaṁ) saṃsiddhau svādiḥ"
  },
  'rAX1_rAXoz_xivAxiH_vqxXO': {
    dev: "राध् (राधोँ) वृद्धौ दिवादिः",
    rom: "rādh (rādhoṁ) vṛddhau divādiḥ"
  },
  'rAs1_rAsqz_BvAxiH_Sabxe': {
    dev: "रास् (रासृँ) शब्दे भ्वादिः",
    rom: "rās (rāsṛṁ) śabde bhvādiḥ"
  },
  'ri2_ri_wuxAxiH_gawO': {
    dev: "रि (रि) गतौ तुदादिः",
    rom: "ri (ri) gatau tudādiḥ"
  },
  'ri1_ri_svAxiH_hiMsAyAm': {
    dev: "रि (रि) हिंसायाम् स्वादिः",
    rom: "ri (ri) hiṃsāyām svādiḥ"
  },
  'rig1_rigiz_BvAxiH_gawO': {
    dev: "रिग् (रिगिँ) गतौ भ्वादिः",
    rom: "rig (rigiṁ) gatau bhvādiḥ"
  },
  'ric2_ricaz_curAxiH_viyojane': {
    dev: "रिच् (रिचँ) वियोजने चुरादिः",
    rom: "ric (ricaṁ) viyojane curādiḥ"
  },
  'ric2_ricaz_curAxiH_samparcane': {
    dev: "रिच् (रिचँ) सम्पर्चने चुरादिः",
    rom: "ric (ricaṁ) samparcane curādiḥ"
  },
  'ric1_ricizr_ruXAxiH_virecane': {
    dev: "रिच् (रिचिँर्) विरेचने रुधादिः",
    rom: "ric (riciṁr) virecane rudhādiḥ"
  },
  'riP1_riPaz_wuxAxiH_kawWane': {
    dev: "रिफ् (रिफँ) कत्थने तुदादिः",
    rom: "riph (riphaṁ) katthane tudādiḥ"
  },
  'riP1_riPaz_wuxAxiH_xAne': {
    dev: "रिफ् (रिफँ) दाने तुदादिः",
    rom: "riph (riphaṁ) dāne tudādiḥ"
  },
  'riP1_riPaz_wuxAxiH_ninxane': {
    dev: "रिफ् (रिफँ) निन्दने तुदादिः",
    rom: "riph (riphaṁ) nindane tudādiḥ"
  },
  'riP1_riPaz_wuxAxiH_yuxXe': {
    dev: "रिफ् (रिफँ) युद्धे तुदादिः",
    rom: "riph (riphaṁ) yuddhe tudādiḥ"
  },
  'riP1_riPaz_wuxAxiH_hiMsAyAm': {
    dev: "रिफ् (रिफँ) हिंसायाम् तुदादिः",
    rom: "riph (riphaṁ) hiṃsāyām tudādiḥ"
  },
  'riv1_riviz_BvAxiH_gawO': {
    dev: "रिव् (रिविँ) गतौ भ्वादिः",
    rom: "riv (riviṁ) gatau bhvādiḥ"
  },
  'riS1_riSaz_wuxAxiH_hiMsAyAm': {
    dev: "रिश् (रिशँ) हिंसायाम् तुदादिः",
    rom: "riś (riśaṁ) hiṃsāyām tudādiḥ"
  },
  'riR1_riRaz_BvAxiH_hiMsAyAm': {
    dev: "रिष् (रिषँ) हिंसायाम् भ्वादिः",
    rom: "riṣ (riṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'rI2_rI_kryAxiH_gawO': {
    dev: "री (री) गतौ क्र्यादिः",
    rom: "rī (rī) gatau kryādiḥ"
  },
  'rI2_rI_kryAxiH_reRaNe': {
    dev: "री (री) रेषणे क्र्यादिः",
    rom: "rī (rī) reṣaṇe kryādiḥ"
  },
  'rI1_rIf_xivAxiH_SravaNe': {
    dev: "री (रीङ्) श्रवणे दिवादिः",
    rom: "rī (rīṅ) śravaṇe divādiḥ"
  },
  'rI1_rIf_xivAxiH_sravaNe': {
    dev: "री (रीङ्) स्रवणे दिवादिः",
    rom: "rī (rīṅ) sravaṇe divādiḥ"
  },
  'ru2_ru_axAxiH_Sabxe': {
    dev: "रु (रु) शब्दे अदादिः",
    rom: "ru (ru) śabde adādiḥ"
  },
  'ru1_ruf_BvAxiH_gawO': {
    dev: "रु (रुङ्) गतौ भ्वादिः",
    rom: "ru (ruṅ) gatau bhvādiḥ"
  },
  'ru1_ruf_BvAxiH_reRaNe': {
    dev: "रु (रुङ्) रेषणे भ्वादिः",
    rom: "ru (ruṅ) reṣaṇe bhvādiḥ"
  },
  'rukRa1_rukRa_curAxiH_pAruRye': {
    dev: "रुक्ष (रुक्ष) पारुष्ये चुरादिः",
    rom: "rukṣa (rukṣa) pāruṣye curādiḥ"
  },
  'rug1_rugiz_BvAxiH_varjane': {
    dev: "रुग् (रुगिँ) वर्जने भ्वादिः",
    rom: "rug (rugiṁ) varjane bhvādiḥ"
  },
  'ruc1_rucaz_BvAxiH_aBiprIwO': {
    dev: "रुच् (रुचँ) अभिप्रीतौ भ्वादिः",
    rom: "ruc (rucaṁ) abhiprītau bhvādiḥ"
  },
  'ruc1_rucaz_BvAxiH_xIpwO': {
    dev: "रुच् (रुचँ) दीप्तौ भ्वादिः",
    rom: "ruc (rucaṁ) dīptau bhvādiḥ"
  },
  'ruj2_rujaz_curAxiH_hiMsAyAm': {
    dev: "रुज् (रुजँ) हिंसायाम् चुरादिः",
    rom: "ruj (rujaṁ) hiṃsāyām curādiḥ"
  },
  'ruj1_rujoz_wuxAxiH_Bafge': {
    dev: "रुज् (रुजोँ) भङ्गे तुदादिः",
    rom: "ruj (rujoṁ) bhaṅge tudādiḥ"
  },
  'rut1_rutaz_BvAxiH_xIpwO': {
    dev: "रुट् (रुटँ) दीप्तौ भ्वादिः",
    rom: "ruṭ (ruṭaṁ) dīptau bhvādiḥ"
  },
  'rut1_rutaz_BvAxiH_prawiGAwe': {
    dev: "रुट् (रुटँ) प्रतिघाते भ्वादिः",
    rom: "ruṭ (ruṭaṁ) pratighāte bhvādiḥ"
  },
  'rut3_rutaz_curAxiH_BAsArWe': {
    dev: "रुट् (रुटँ) भासार्थे चुरादिः",
    rom: "ruṭ (ruṭaṁ) bhāsārthe curādiḥ"
  },
  'rut3_rutaz_curAxiH_roRe': {
    dev: "रुट् (रुटँ) रोषे चुरादिः",
    rom: "ruṭ (ruṭaṁ) roṣe curādiḥ"
  },
  'rut2_rutiz_BvAxiH_sweye': {
    dev: "रुट् (रुटिँ) स्तेये भ्वादिः",
    rom: "ruṭ (ruṭiṁ) steye bhvādiḥ"
  },
  'ruT1_ruTaz_BvAxiH_upaGAwe': {
    dev: "रुठ् (रुठँ) उपघाते भ्वादिः",
    rom: "ruṭh (ruṭhaṁ) upaghāte bhvādiḥ"
  },
  'ruT1_ruTaz_BvAxiH_prawiGAwe': {
    dev: "रुठ् (रुठँ) प्रतिघाते भ्वादिः",
    rom: "ruṭh (ruṭhaṁ) pratighāte bhvādiḥ"
  },
  'ruT3_ruTaz_curAxiH_BARArWe': {
    dev: "रुठ् (रुठँ) भाषार्थे चुरादिः",
    rom: "ruṭh (ruṭhaṁ) bhāṣārthe curādiḥ"
  },
  'ruT2_ruTiz_BvAxiH_Alasye': {
    dev: "रुठ् (रुठिँ) आलस्ये भ्वादिः",
    rom: "ruṭh (ruṭhiṁ) ālasye bhvādiḥ"
  },
  'ruT2_ruTiz_BvAxiH_gawiprawiGAwe': {
    dev: "रुठ् (रुठिँ) गतिप्रतिघाते भ्वादिः",
    rom: "ruṭh (ruṭhiṁ) gatipratighāte bhvādiḥ"
  },
  'ruT2_ruTiz_BvAxiH_gawO': {
    dev: "रुठ् (रुठिँ) गतौ भ्वादिः",
    rom: "ruṭh (ruṭhiṁ) gatau bhvādiḥ"
  },
  'ruT2_ruTiz_BvAxiH_sweye': {
    dev: "रुठ् (रुठिँ) स्तेये भ्वादिः",
    rom: "ruṭh (ruṭhiṁ) steye bhvādiḥ"
  },
  'rux1_ruxizr_axAxiH_aSruvimocane': {
    dev: "रुद् (रुदिँर्) अश्रुविमोचने अदादिः",
    rom: "rud (rudiṁr) aśruvimocane adādiḥ"
  },
  'ruX1_ruXizr_ruXAxiH_AvaraNe': {
    dev: "रुध् (रुधिँर्) आवरणे रुधादिः",
    rom: "rudh (rudhiṁr) āvaraṇe rudhādiḥ"
  },
  'rup1_rupaz_xivAxiH_vimohane': {
    dev: "रुप् (रुपँ) विमोहने दिवादिः",
    rom: "rup (rupaṁ) vimohane divādiḥ"
  },
  'ruS1_ruSaz_wuxAxiH_hiMsAyAm': {
    dev: "रुश् (रुशँ) हिंसायाम् तुदादिः",
    rom: "ruś (ruśaṁ) hiṃsāyām tudādiḥ"
  },
  'ruR3_ruRaz_curAxiH_roRe': {
    dev: "रुष् (रुषँ) रोषे चुरादिः",
    rom: "ruṣ (ruṣaṁ) roṣe curādiḥ"
  },
  'ruR2_ruRaz_xivAxiH_roRe': {
    dev: "रुष् (रुषँ) रोषे दिवादिः",
    rom: "ruṣ (ruṣaṁ) roṣe divādiḥ"
  },
  'ruR1_ruRaz_BvAxiH_hiMsAyAm': {
    dev: "रुष् (रुषँ) हिंसायाम् भ्वादिः",
    rom: "ruṣ (ruṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'rus1_rusiz_curAxiH_BARArWe': {
    dev: "रुस् (रुसिँ) भाषार्थे चुरादिः",
    rom: "rus (rusiṁ) bhāṣārthe curādiḥ"
  },
  'ruh1_ruhaz_BvAxiH_avagamane': {
    dev: "रुह् (रुहँ) अवगमने भ्वादिः",
    rom: "ruh (ruhaṁ) avagamane bhvādiḥ"
  },
  'ruh1_ruhaz_BvAxiH_janmaniprAxurBAve': {
    dev: "रुह् (रुहँ) जन्मनिप्रादुर्भावे भ्वादिः",
    rom: "ruh (ruhaṁ) janmaniprādurbhāve bhvādiḥ"
  },
  'ruh1_ruhaz_BvAxiH_prAxurBAve': {
    dev: "रुह् (रुहँ) प्रादुर्भावे भ्वादिः",
    rom: "ruh (ruhaṁ) prādurbhāve bhvādiḥ"
  },
  'ruh1_ruhaz_BvAxiH_bIjajanmani': {
    dev: "रुह् (रुहँ) बीजजन्मनि भ्वादिः",
    rom: "ruh (ruhaṁ) bījajanmani bhvādiḥ"
  },
  'rUkRa1_rUkRa_curAxiH_pAruRye': {
    dev: "रूक्ष (रूक्ष) पारुष्ये चुरादिः",
    rom: "rūkṣa (rūkṣa) pāruṣye curādiḥ"
  },
  'rUpa1_rUpa_curAxiH_rUpakriyAyAm': {
    dev: "रूप (रूप) रूपक्रियायाम् चुरादिः",
    rom: "rūpa (rūpa) rūpakriyāyām curādiḥ"
  },
  'rek1_rekqz_BvAxiH_SafkAyAm': {
    dev: "रेक् (रेकृँ) शङ्कायाम् भ्वादिः",
    rom: "rek (rekṛṁ) śaṅkāyām bhvādiḥ"
  },
  'ret1_retqz_BvAxiH_pariBARaNe': {
    dev: "रेट् (रेटृँ) परिभाषणे भ्वादिः",
    rom: "reṭ (reṭṛṁ) paribhāṣaṇe bhvādiḥ"
  },
  'rep1_repqz_BvAxiH_gawO': {
    dev: "रेप् (रेपृँ) गतौ भ्वादिः",
    rom: "rep (repṛṁ) gatau bhvādiḥ"
  },
  'rep1_repqz_BvAxiH_Sabxe': {
    dev: "रेप् (रेपृँ) शब्दे भ्वादिः",
    rom: "rep (repṛṁ) śabde bhvādiḥ"
  },
  'reb1_rebqz_BvAxiH_gawO': {
    dev: "रेब् (रेबृँ) गतौ भ्वादिः",
    rom: "reb (rebṛṁ) gatau bhvādiḥ"
  },
  'reB1_reBqz_BvAxiH_Sabxe': {
    dev: "रेभ् (रेभृँ) शब्दे भ्वादिः",
    rom: "rebh (rebhṛṁ) śabde bhvādiḥ"
  },
  'rev1_revqz_BvAxiH_gawO': {
    dev: "रेव् (रेवृँ) गतौ भ्वादिः",
    rom: "rev (revṛṁ) gatau bhvādiḥ"
  },
  'rev1_revqz_BvAxiH_pluwigawO': {
    dev: "रेव् (रेवृँ) प्लुतिगतौ भ्वादिः",
    rom: "rev (revṛṁ) plutigatau bhvādiḥ"
  },
  'reR1_reRqz_BvAxiH_avyakwe_Sabxe': {
    dev: "रेष् (रेषृँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "reṣ (reṣṛṁ) avyakte_śabde bhvādiḥ"
  },
  'rE1_rE_BvAxiH_Sabxe': {
    dev: "रै (रै) शब्दे भ्वादिः",
    rom: "rai (rai) śabde bhvādiḥ"
  },
  'rod1_rodqz_BvAxiH_unmAxe': {
    dev: "रोड् (रोडृँ) उन्मादे भ्वादिः",
    rom: "roḍ (roḍṛṁ) unmāde bhvādiḥ"
  },
  'rOd1_rOdqz_BvAxiH_anAxare': {
    dev: "रौड् (रौडृँ) अनादरे भ्वादिः",
    rom: "rauḍ (rauḍṛṁ) anādare bhvādiḥ"
  },
  'lak1_lakaz_curAxiH_AsvAxane': {
    dev: "लक् (लकँ) आस्वादने चुरादिः",
    rom: "lak (lakaṁ) āsvādane curādiḥ"
  },
  'lakR1_lakRaz_curAxiH_afkane': {
    dev: "लक्ष् (लक्षँ) अङ्कने चुरादिः",
    rom: "lakṣ (lakṣaṁ) aṅkane curādiḥ"
  },
  'lakR1_lakRaz_curAxiH_Alocane': {
    dev: "लक्ष् (लक्षँ) आलोचने चुरादिः",
    rom: "lakṣ (lakṣaṁ) ālocane curādiḥ"
  },
  'lakR2_lakRaz_curAxiH_xarSane': {
    dev: "लक्ष् (लक्षँ) दर्शने चुरादिः",
    rom: "lakṣ (lakṣaṁ) darśane curādiḥ"
  },
  'laK1_laKaz_BvAxiH_gawO': {
    dev: "लख् (लखँ) गतौ भ्वादिः",
    rom: "lakh (lakhaṁ) gatau bhvādiḥ"
  },
  'laK2_laKiz_BvAxiH_gawO': {
    dev: "लख् (लखिँ) गतौ भ्वादिः",
    rom: "lakh (lakhiṁ) gatau bhvādiḥ"
  },
  'lag3_lagaz_curAxiH_AsvAxane': {
    dev: "लग् (लगँ) आस्वादने चुरादिः",
    rom: "lag (lagaṁ) āsvādane curādiḥ"
  },
  'lag1_lagiz_BvAxiH_gawO': {
    dev: "लग् (लगिँ) गतौ भ्वादिः",
    rom: "lag (lagiṁ) gatau bhvādiḥ"
  },
  'lag2_lagez_BvAxiH_safge': {
    dev: "लग् (लगेँ) सङ्गे भ्वादिः",
    rom: "lag (lageṁ) saṅge bhvādiḥ"
  },
  'laG1_laGiz_BvAxiH_gawO': {
    dev: "लघ् (लघिँ) गतौ भ्वादिः",
    rom: "lagh (laghiṁ) gatau bhvādiḥ"
  },
  'laG3_laGiz_curAxiH_BARArWe': {
    dev: "लघ् (लघिँ) भाषार्थे चुरादिः",
    rom: "lagh (laghiṁ) bhāṣārthe curādiḥ"
  },
  'laG3_laGiz_curAxiH_BAsArWe': {
    dev: "लघ् (लघिँ) भासार्थे चुरादिः",
    rom: "lagh (laghiṁ) bhāsārthe curādiḥ"
  },
  'laG1_laGiz_BvAxiH_BojananivqwwO': {
    dev: "लघ् (लघिँ) भोजननिवृत्तौ भ्वादिः",
    rom: "lagh (laghiṁ) bhojananivṛttau bhvādiḥ"
  },
  'laG2_laGiz_BvAxiH_SoRaNe': {
    dev: "लघ् (लघिँ) शोषणे भ्वादिः",
    rom: "lagh (laghiṁ) śoṣaṇe bhvādiḥ"
  },
  'laC1_laCaz_BvAxiH_lakRaNe': {
    dev: "लछ् (लछँ) लक्षणे भ्वादिः",
    rom: "lach (lachaṁ) lakṣaṇe bhvādiḥ"
  },
  'laja1_laja_curAxiH_prakASane': {
    dev: "लज (लज) प्रकाशने चुरादिः",
    rom: "laja (laja) prakāśane curādiḥ"
  },
  'laja1_laja_curAxiH_prANane': {
    dev: "लज (लज) प्राणने चुरादिः",
    rom: "laja (laja) prāṇane curādiḥ"
  },
  'laj3_ozlajIz_wuxAxiH_vrIdAyAm': {
    dev: "लज् (ओँलजीँ) व्रीडायाम् तुदादिः",
    rom: "laj (oṁlajīṁ) vrīḍāyām tudādiḥ"
  },
  'laj1_lajaz_BvAxiH_Barjane': {
    dev: "लज् (लजँ) भर्जने भ्वादिः",
    rom: "laj (lajaṁ) bharjane bhvādiḥ"
  },
  'laj1_lajaz_BvAxiH_Barwsane': {
    dev: "लज् (लजँ) भर्त्सने भ्वादिः",
    rom: "laj (lajaṁ) bhartsane bhvādiḥ"
  },
  'laj4_lajiz_curAxiH_prakASane': {
    dev: "लज् (लजिँ) प्रकाशने चुरादिः",
    rom: "laj (lajiṁ) prakāśane curādiḥ"
  },
  'laj2_lajiz_BvAxiH_Barjane': {
    dev: "लज् (लजिँ) भर्जने भ्वादिः",
    rom: "laj (lajiṁ) bharjane bhvādiḥ"
  },
  'laj2_lajiz_BvAxiH_Barwsane': {
    dev: "लज् (लजिँ) भर्त्सने भ्वादिः",
    rom: "laj (lajiṁ) bhartsane bhvādiḥ"
  },
  'laj4_lajiz_curAxiH_BARArWe': {
    dev: "लज् (लजिँ) भाषार्थे चुरादिः",
    rom: "laj (lajiṁ) bhāṣārthe curādiḥ"
  },
  'laj4_lajiz_curAxiH_BAsArWe': {
    dev: "लज् (लजिँ) भासार्थे चुरादिः",
    rom: "laj (lajiṁ) bhāsārthe curādiḥ"
  },
  'lat1_lataz_BvAxiH_bAlye': {
    dev: "लट् (लटँ) बाल्ये भ्वादिः",
    rom: "laṭ (laṭaṁ) bālye bhvādiḥ"
  },
  'lat2_lataz_curAxiH_BARArWe': {
    dev: "लट् (लटँ) भाषार्थे चुरादिः",
    rom: "laṭ (laṭaṁ) bhāṣārthe curādiḥ"
  },
  'lad3_ozladiz_curAxiH_uwkRepaNe': {
    dev: "लड् (ओँलडिँ) उत्क्षेपणे चुरादिः",
    rom: "laḍ (oṁlaḍiṁ) utkṣepaṇe curādiḥ"
  },
  'lad2_ladaz_curAxiH_upasevAyAm': {
    dev: "लड् (लडँ) उपसेवायाम् चुरादिः",
    rom: "laḍ (laḍaṁ) upasevāyām curādiḥ"
  },
  'lad1_ladaz_BvAxiH_vilAse': {
    dev: "लड् (लडँ) विलासे भ्वादिः",
    rom: "laḍ (laḍaṁ) vilāse bhvādiḥ"
  },
  'lap1_lapaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "लप् (लपँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "lap (lapaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'lab1_labiz_BvAxiH_avasraMsane': {
    dev: "लब् (लबिँ) अवस्रंसने भ्वादिः",
    rom: "lab (labiṁ) avasraṃsane bhvādiḥ"
  },
  'lab1_labiz_BvAxiH_Sabxe': {
    dev: "लब् (लबिँ) शब्दे भ्वादिः",
    rom: "lab (labiṁ) śabde bhvādiḥ"
  },
  'laB1_dulaBazR_BvAxiH_prApwO': {
    dev: "लभ् (डुलभँष्) प्राप्तौ भ्वादिः",
    rom: "labh (ḍulabhaṁṣ) prāptau bhvādiḥ"
  },
  'larb1_larbaz_BvAxiH_gawO': {
    dev: "लर्ब् (लर्बँ) गतौ भ्वादिः",
    rom: "larb (larbaṁ) gatau bhvādiḥ"
  },
  'lal1_lalaz_curAxiH_IpsAyAm': {
    dev: "लल् (ललँ) ईप्सायाम् चुरादिः",
    rom: "lal (lalaṁ) īpsāyām curādiḥ"
  },
  'laR1_laRaz_BvAxiH_kAnwO': {
    dev: "लष् (लषँ) कान्तौ भ्वादिः",
    rom: "laṣ (laṣaṁ) kāntau bhvādiḥ"
  },
  'las1_lasaz_BvAxiH_krIdAyAm': {
    dev: "लस् (लसँ) क्रीडायाम् भ्वादिः",
    rom: "las (lasaṁ) krīḍāyām bhvādiḥ"
  },
  'las2_lasaz_curAxiH_Silpayoge': {
    dev: "लस् (लसँ) शिल्पयोगे चुरादिः",
    rom: "las (lasaṁ) śilpayoge curādiḥ"
  },
  'las1_lasaz_BvAxiH_SleRaNe': {
    dev: "लस् (लसँ) श्लेषणे भ्वादिः",
    rom: "las (lasaṁ) śleṣaṇe bhvādiḥ"
  },
  'lasj1_ozlasjIz_wuxAxiH_vrIdAyAm': {
    dev: "लस्ज् (ओँलस्जीँ) व्रीडायाम् तुदादिः",
    rom: "lasj (oṁlasjīṁ) vrīḍāyām tudādiḥ"
  },
  'lA1_lA_axAxiH_AxAne': {
    dev: "ला (ला) आदाने अदादिः",
    rom: "lā (lā) ādāne adādiḥ"
  },
  'lAK1_lAKqz_BvAxiH_alamarWe': {
    dev: "लाख् (लाखृँ) अलमर्थे भ्वादिः",
    rom: "lākh (lākhṛṁ) alamarthe bhvādiḥ"
  },
  'lAK1_lAKqz_BvAxiH_SoRaNe': {
    dev: "लाख् (लाखृँ) शोषणे भ्वादिः",
    rom: "lākh (lākhṛṁ) śoṣaṇe bhvādiḥ"
  },
  'lAG1_lAGqz_BvAxiH_sAmarWye': {
    dev: "लाघ् (लाघृँ) सामर्थ्ये भ्वादिः",
    rom: "lāgh (lāghṛṁ) sāmarthye bhvādiḥ"
  },
  'lAC1_lACiz_BvAxiH_lakRaNe': {
    dev: "लाछ् (लाछिँ) लक्षणे भ्वादिः",
    rom: "lāch (lāchiṁ) lakṣaṇe bhvādiḥ"
  },
  'lAj1_lAjaz_BvAxiH_Barjane': {
    dev: "लाज् (लाजँ) भर्जने भ्वादिः",
    rom: "lāj (lājaṁ) bharjane bhvādiḥ"
  },
  'lAj1_lAjaz_BvAxiH_Barwsane': {
    dev: "लाज् (लाजँ) भर्त्सने भ्वादिः",
    rom: "lāj (lājaṁ) bhartsane bhvādiḥ"
  },
  'lAj2_lAjiz_BvAxiH_Barjane': {
    dev: "लाज् (लाजिँ) भर्जने भ्वादिः",
    rom: "lāj (lājiṁ) bharjane bhvādiḥ"
  },
  'lAj2_lAjiz_BvAxiH_Barwsane': {
    dev: "लाज् (लाजिँ) भर्त्सने भ्वादिः",
    rom: "lāj (lājiṁ) bhartsane bhvādiḥ"
  },
  'lABa1_lABa_curAxiH_preraNe': {
    dev: "लाभ (लाभ) प्रेरणे चुरादिः",
    rom: "lābha (lābha) preraṇe curādiḥ"
  },
  'liK1_liKaz_wuxAxiH_akRaravinyAse': {
    dev: "लिख् (लिखँ) अक्षरविन्यासे तुदादिः",
    rom: "likh (likhaṁ) akṣaravinyāse tudādiḥ"
  },
  'lig1_ligiz_BvAxiH_gawO': {
    dev: "लिग् (लिगिँ) गतौ भ्वादिः",
    rom: "lig (ligiṁ) gatau bhvādiḥ"
  },
  'lig2_ligiz_curAxiH_ciwrIkaraNe': {
    dev: "लिग् (लिगिँ) चित्रीकरणे चुरादिः",
    rom: "lig (ligiṁ) citrīkaraṇe curādiḥ"
  },
  'lip1_lipaz_wuxAxiH_upaxAhe': {
    dev: "लिप् (लिपँ) उपदाहे तुदादिः",
    rom: "lip (lipaṁ) upadāhe tudādiḥ"
  },
  'lip1_lipaz_wuxAxiH_upaxehe': {
    dev: "लिप् (लिपँ) उपदेहे तुदादिः",
    rom: "lip (lipaṁ) upadehe tudādiḥ"
  },
  'liS1_liSaz_xivAxiH_alpIBAve': {
    dev: "लिश् (लिशँ) अल्पीभावे दिवादिः",
    rom: "liś (liśaṁ) alpībhāve divādiḥ"
  },
  'liS2_liSaz_wuxAxiH_gawO': {
    dev: "लिश् (लिशँ) गतौ तुदादिः",
    rom: "liś (liśaṁ) gatau tudādiḥ"
  },
  'lih1_lihaz_axAxiH_AsvAxane': {
    dev: "लिह् (लिहँ) आस्वादने अदादिः",
    rom: "lih (lihaṁ) āsvādane adādiḥ"
  },
  'lI3_lI_curAxiH_xravIkaraNe': {
    dev: "ली (ली) द्रवीकरणे चुरादिः",
    rom: "lī (lī) dravīkaraṇe curādiḥ"
  },
  'lI2_lI_kryAxiH_SleRaNe': {
    dev: "ली (ली) श्लेषणे क्र्यादिः",
    rom: "lī (lī) śleṣaṇe kryādiḥ"
  },
  'lI1_lIf_xivAxiH_SleRaNe': {
    dev: "ली (लीङ्) श्लेषणे दिवादिः",
    rom: "lī (līṅ) śleṣaṇe divādiḥ"
  },
  'luj1_lujiz_curAxiH_nikewane': {
    dev: "लुज् (लुजिँ) निकेतने चुरादिः",
    rom: "luj (lujiṁ) niketane curādiḥ"
  },
  'luj1_lujiz_curAxiH_balAxAne': {
    dev: "लुज् (लुजिँ) बलादाने चुरादिः",
    rom: "luj (lujiṁ) balādāne curādiḥ"
  },
  'luj1_lujiz_curAxiH_BARArWe': {
    dev: "लुज् (लुजिँ) भाषार्थे चुरादिः",
    rom: "luj (lujiṁ) bhāṣārthe curādiḥ"
  },
  'luj1_lujiz_curAxiH_BAsArWe': {
    dev: "लुज् (लुजिँ) भासार्थे चुरादिः",
    rom: "luj (lujiṁ) bhāsārthe curādiḥ"
  },
  'luj1_lujiz_curAxiH_hiMsAyAm': {
    dev: "लुज् (लुजिँ) हिंसायाम् चुरादिः",
    rom: "luj (lujiṁ) hiṃsāyām curādiḥ"
  },
  'lut1_lutaz_BvAxiH_prawiGAwe': {
    dev: "लुट् (लुटँ) प्रतिघाते भ्वादिः",
    rom: "luṭ (luṭaṁ) pratighāte bhvādiḥ"
  },
  'lut6_lutaz_curAxiH_BARArWe': {
    dev: "लुट् (लुटँ) भाषार्थे चुरादिः",
    rom: "luṭ (luṭaṁ) bhāṣārthe curādiḥ"
  },
  'lut6_lutaz_curAxiH_BAsArWe': {
    dev: "लुट् (लुटँ) भासार्थे चुरादिः",
    rom: "luṭ (luṭaṁ) bhāsārthe curādiḥ"
  },
  'lut4_lutaz_xivAxiH_vilotane': {
    dev: "लुट् (लुटँ) विलोटने दिवादिः",
    rom: "luṭ (luṭaṁ) viloṭane divādiḥ"
  },
  'lut2_lutaz_BvAxiH_vilotane': {
    dev: "लुट् (लुटँ) विलोटने भ्वादिः",
    rom: "luṭ (luṭaṁ) viloṭane bhvādiḥ"
  },
  'lut5_lutaz_wuxAxiH_saMSleRaNe': {
    dev: "लुट् (लुटँ) संश्लेषणे तुदादिः",
    rom: "luṭ (luṭaṁ) saṃśleṣaṇe tudādiḥ"
  },
  'lut3_lutiz_BvAxiH_sweye': {
    dev: "लुट् (लुटिँ) स्तेये भ्वादिः",
    rom: "luṭ (luṭiṁ) steye bhvādiḥ"
  },
  'luT1_luTaz_BvAxiH_Alasye': {
    dev: "लुठ् (लुठँ) आलस्ये भ्वादिः",
    rom: "luṭh (luṭhaṁ) ālasye bhvādiḥ"
  },
  'luT1_luTaz_BvAxiH_upaGAwe': {
    dev: "लुठ् (लुठँ) उपघाते भ्वादिः",
    rom: "luṭh (luṭhaṁ) upaghāte bhvādiḥ"
  },
  'luT1_luTaz_BvAxiH_prawiGAwe': {
    dev: "लुठ् (लुठँ) प्रतिघाते भ्वादिः",
    rom: "luṭh (luṭhaṁ) pratighāte bhvādiḥ"
  },
  'luT3_luTaz_wuxAxiH_saMSleRaNe': {
    dev: "लुठ् (लुठँ) संश्लेषणे तुदादिः",
    rom: "luṭh (luṭhaṁ) saṃśleṣaṇe tudādiḥ"
  },
  'luT2_luTiz_BvAxiH_Alasye': {
    dev: "लुठ् (लुठिँ) आलस्ये भ्वादिः",
    rom: "luṭh (luṭhiṁ) ālasye bhvādiḥ"
  },
  'luT2_luTiz_BvAxiH_gawO': {
    dev: "लुठ् (लुठिँ) गतौ भ्वादिः",
    rom: "luṭh (luṭhiṁ) gatau bhvādiḥ"
  },
  'luT2_luTiz_BvAxiH_sweye': {
    dev: "लुठ् (लुठिँ) स्तेये भ्वादिः",
    rom: "luṭh (luṭhiṁ) steye bhvādiḥ"
  },
  'luNT1_luNTaz_curAxiH_sweye': {
    dev: "लुण्ठ् (लुण्ठँ) स्तेये चुरादिः",
    rom: "luṇṭh (luṇṭhaṁ) steye curādiḥ"
  },
  'luW1_luWiz_BvAxiH_safkleSane': {
    dev: "लुथ् (लुथिँ) सङ्क्लेशने भ्वादिः",
    rom: "luth (luthiṁ) saṅkleśane bhvādiḥ"
  },
  'luW1_luWiz_BvAxiH_hiMsAyAm': {
    dev: "लुथ् (लुथिँ) हिंसायाम् भ्वादिः",
    rom: "luth (luthiṁ) hiṃsāyām bhvādiḥ"
  },
  'lunc1_luncaz_BvAxiH_apanayane': {
    dev: "लुन्च् (लुन्चँ) अपनयने भ्वादिः",
    rom: "lunc (luncaṁ) apanayane bhvādiḥ"
  },
  'lup1_lupaz_xivAxiH_vimohane': {
    dev: "लुप् (लुपँ) विमोहने दिवादिः",
    rom: "lup (lupaṁ) vimohane divādiḥ"
  },
  'lup2_lupLz_wuxAxiH_Caxane': {
    dev: "लुप् (लुपॢँ) छदने तुदादिः",
    rom: "lup (lupḷṁ) chadane tudādiḥ"
  },
  'lup2_lupLz_wuxAxiH_Cexane': {
    dev: "लुप् (लुपॢँ) छेदने तुदादिः",
    rom: "lup (lupḷṁ) chedane tudādiḥ"
  },
  'lub2_lubiz_curAxiH_axarSane': {
    dev: "लुब् (लुबिँ) अदर्शने चुरादिः",
    rom: "lub (lubiṁ) adarśane curādiḥ"
  },
  'lub2_lubiz_curAxiH_arxane': {
    dev: "लुब् (लुबिँ) अर्दने चुरादिः",
    rom: "lub (lubiṁ) ardane curādiḥ"
  },
  'lub1_lubiz_BvAxiH_arxane': {
    dev: "लुब् (लुबिँ) अर्दने भ्वादिः",
    rom: "lub (lubiṁ) ardane bhvādiḥ"
  },
  'luB1_luBaz_xivAxiH_gArxXye': {
    dev: "लुभ् (लुभँ) गार्द्ध्ये दिवादिः",
    rom: "lubh (lubhaṁ) gārddhye divādiḥ"
  },
  'luB2_luBaz_wuxAxiH_vimohane': {
    dev: "लुभ् (लुभँ) विमोहने तुदादिः",
    rom: "lubh (lubhaṁ) vimohane tudādiḥ"
  },
  'lU1_lUF_kryAxiH_Cexane': {
    dev: "लू (लूञ्) छेदने क्र्यादिः",
    rom: "lū (lūñ) chedane kryādiḥ"
  },
  'lUR1_lURaz_curAxiH_hiMsAyAm': {
    dev: "लूष् (लूषँ) हिंसायाम् चुरादिः",
    rom: "lūṣ (lūṣaṁ) hiṃsāyām curādiḥ"
  },
  'lep1_lepqz_BvAxiH_gawO': {
    dev: "लेप् (लेपृँ) गतौ भ्वादिः",
    rom: "lep (lepṛṁ) gatau bhvādiḥ"
  },
  'lok1_lokqz_BvAxiH_xarSane': {
    dev: "लोक् (लोकृँ) दर्शने भ्वादिः",
    rom: "lok (lokṛṁ) darśane bhvādiḥ"
  },
  'lok2_lokqz_curAxiH_BARArWe': {
    dev: "लोक् (लोकृँ) भाषार्थे चुरादिः",
    rom: "lok (lokṛṁ) bhāṣārthe curādiḥ"
  },
  'lok2_lokqz_curAxiH_BAsArWe': {
    dev: "लोक् (लोकृँ) भासार्थे चुरादिः",
    rom: "lok (lokṛṁ) bhāsārthe curādiḥ"
  },
  'loc1_locqz_BvAxiH_xarSane': {
    dev: "लोच् (लोचृँ) दर्शने भ्वादिः",
    rom: "loc (locṛṁ) darśane bhvādiḥ"
  },
  'loc2_locqz_curAxiH_BARArWe': {
    dev: "लोच् (लोचृँ) भाषार्थे चुरादिः",
    rom: "loc (locṛṁ) bhāṣārthe curādiḥ"
  },
  'loc2_locqz_curAxiH_BAsArWe': {
    dev: "लोच् (लोचृँ) भासार्थे चुरादिः",
    rom: "loc (locṛṁ) bhāsārthe curādiḥ"
  },
  'lod1_lodqz_BvAxiH_unmAxe': {
    dev: "लोड् (लोडृँ) उन्मादे भ्वादिः",
    rom: "loḍ (loḍṛṁ) unmāde bhvādiḥ"
  },
  'loRt1_loRtaz_BvAxiH_safGAwe': {
    dev: "लोष्ट् (लोष्टँ) सङ्घाते भ्वादिः",
    rom: "loṣṭ (loṣṭaṁ) saṅghāte bhvādiḥ"
  },
  'lOd1_lOdqz_BvAxiH_unmAxe': {
    dev: "लौड् (लौडृँ) उन्मादे भ्वादिः",
    rom: "lauḍ (lauḍṛṁ) unmāde bhvādiḥ"
  },
  'lvI1_lvI_kryAxiH_gawO': {
    dev: "ल्वी (ल्वी) गतौ क्र्यादिः",
    rom: "lvī (lvī) gatau kryādiḥ"
  },
  'vak1_vakiz_BvAxiH_kOtilye': {
    dev: "वक् (वकिँ) कौटिल्ये भ्वादिः",
    rom: "vak (vakiṁ) kauṭilye bhvādiḥ"
  },
  'vak1_vakiz_BvAxiH_gawO': {
    dev: "वक् (वकिँ) गतौ भ्वादिः",
    rom: "vak (vakiṁ) gatau bhvādiḥ"
  },
  'vakR1_vakRaz_BvAxiH_roRe': {
    dev: "वक्ष् (वक्षँ) रोषे भ्वादिः",
    rom: "vakṣ (vakṣaṁ) roṣe bhvādiḥ"
  },
  'vakR1_vakRaz_BvAxiH_safGAwe': {
    dev: "वक्ष् (वक्षँ) सङ्घाते भ्वादिः",
    rom: "vakṣ (vakṣaṁ) saṅghāte bhvādiḥ"
  },
  'vaK1_vaKaz_BvAxiH_gawO': {
    dev: "वख् (वखँ) गतौ भ्वादिः",
    rom: "vakh (vakhaṁ) gatau bhvādiḥ"
  },
  'vaK2_vaKiz_BvAxiH_gawO': {
    dev: "वख् (वखिँ) गतौ भ्वादिः",
    rom: "vakh (vakhiṁ) gatau bhvādiḥ"
  },
  'vag1_vagiz_BvAxiH_gawO': {
    dev: "वग् (वगिँ) गतौ भ्वादिः",
    rom: "vag (vagiṁ) gatau bhvādiḥ"
  },
  'vaG1_vaGiz_BvAxiH_gawyAkRepe': {
    dev: "वघ् (वघिँ) गत्याक्षेपे भ्वादिः",
    rom: "vagh (vaghiṁ) gatyākṣepe bhvādiḥ"
  },
  'vac1_vacaz_axAxiH_pariBARaNe': {
    dev: "वच् (वचँ) परिभाषणे अदादिः",
    rom: "vac (vacaṁ) paribhāṣaṇe adādiḥ"
  },
  'vac2_vacaz_curAxiH_pariBARaNe': {
    dev: "वच् (वचँ) परिभाषणे चुरादिः",
    rom: "vac (vacaṁ) paribhāṣaṇe curādiḥ"
  },
  'vaj2_vajaz_curAxiH_gawO': {
    dev: "वज् (वजँ) गतौ चुरादिः",
    rom: "vaj (vajaṁ) gatau curādiḥ"
  },
  'vaj1_vajaz_BvAxiH_gawO': {
    dev: "वज् (वजँ) गतौ भ्वादिः",
    rom: "vaj (vajaṁ) gatau bhvādiḥ"
  },
  'vaj2_vajaz_curAxiH_mArgasaMskAre': {
    dev: "वज् (वजँ) मार्गसंस्कारे चुरादिः",
    rom: "vaj (vajaṁ) mārgasaṃskāre curādiḥ"
  },
  'vata1_vata_curAxiH_granWe': {
    dev: "वट (वट) ग्रन्थे चुरादिः",
    rom: "vaṭa (vaṭa) granthe curādiḥ"
  },
  'vata1_vata_curAxiH_viBAjane': {
    dev: "वट (वट) विभाजने चुरादिः",
    rom: "vaṭa (vaṭa) vibhājane curādiḥ"
  },
  'vat1_vataz_BvAxiH_pariBARaNe': {
    dev: "वट् (वटँ) परिभाषणे भ्वादिः",
    rom: "vaṭ (vaṭaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'vat1_vataz_BvAxiH_veRtane': {
    dev: "वट् (वटँ) वेष्टने भ्वादिः",
    rom: "vaṭ (vaṭaṁ) veṣṭane bhvādiḥ"
  },
  'vat3_vatiz_curAxiH_viBAjane': {
    dev: "वट् (वटिँ) विभाजने चुरादिः",
    rom: "vaṭ (vaṭiṁ) vibhājane curādiḥ"
  },
  'vat2_vatiz_BvAxiH_viBAjane': {
    dev: "वट् (वटिँ) विभाजने भ्वादिः",
    rom: "vaṭ (vaṭiṁ) vibhājane bhvādiḥ"
  },
  'vaT1_vaTaz_BvAxiH_sWOlye': {
    dev: "वठ् (वठँ) स्थौल्ये भ्वादिः",
    rom: "vaṭh (vaṭhaṁ) sthaulye bhvādiḥ"
  },
  'vaT2_vaTiz_BvAxiH_ekacaryAyAm': {
    dev: "वठ् (वठिँ) एकचर्यायाम् भ्वादिः",
    rom: "vaṭh (vaṭhiṁ) ekacaryāyām bhvādiḥ"
  },
  'vad2_vadiz_curAxiH_viBAjane': {
    dev: "वड् (वडिँ) विभाजने चुरादिः",
    rom: "vaḍ (vaḍiṁ) vibhājane curādiḥ"
  },
  'vad1_vadiz_BvAxiH_viBAjane': {
    dev: "वड् (वडिँ) विभाजने भ्वादिः",
    rom: "vaḍ (vaḍiṁ) vibhājane bhvādiḥ"
  },
  'vad1_vadiz_BvAxiH_veRtane': {
    dev: "वड् (वडिँ) वेष्टने भ्वादिः",
    rom: "vaḍ (vaḍiṁ) veṣṭane bhvādiḥ"
  },
  'vaN1_vaNaz_BvAxiH_Sabxe': {
    dev: "वण् (वणँ) शब्दे भ्वादिः",
    rom: "vaṇ (vaṇaṁ) śabde bhvādiḥ"
  },
  'vax1_vaxaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "वद् (वदँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "vad (vadaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'vax3_vaxaz_curAxiH_sanxeSavacane': {
    dev: "वद् (वदँ) सन्देशवचने चुरादिः",
    rom: "vad (vadaṁ) sandeśavacane curādiḥ"
  },
  'vax2_vaxiz_BvAxiH_aBivAxane': {
    dev: "वद् (वदिँ) अभिवादने भ्वादिः",
    rom: "vad (vadiṁ) abhivādane bhvādiḥ"
  },
  'vax2_vaxiz_BvAxiH_swuwO': {
    dev: "वद् (वदिँ) स्तुतौ भ्वादिः",
    rom: "vad (vadiṁ) stutau bhvādiḥ"
  },
  'van1_vanaz_BvAxiH_BakwO': {
    dev: "वन् (वनँ) भक्तौ भ्वादिः",
    rom: "van (vanaṁ) bhaktau bhvādiḥ"
  },
  'van1_vanaz_BvAxiH_Sabxe': {
    dev: "वन् (वनँ) शब्दे भ्वादिः",
    rom: "van (vanaṁ) śabde bhvādiḥ"
  },
  'van1_vanaz_BvAxiH_samBakwO': {
    dev: "वन् (वनँ) सम्भक्तौ भ्वादिः",
    rom: "van (vanaṁ) sambhaktau bhvādiḥ"
  },
  'van2_vanuz_BvAxiH_anekArWawve': {
    dev: "वन् (वनुँ) अनेकार्थत्वे भ्वादिः",
    rom: "van (vanuṁ) anekārthatve bhvādiḥ"
  },
  'van3_vanuz_wanAxiH_yAFcAyAm': {
    dev: "वन् (वनुँ) याञ्चायाम् तनादिः",
    rom: "van (vanuṁ) yāñcāyām tanādiḥ"
  },
  'vanc1_vancuz_BvAxiH_gawO': {
    dev: "वन्च् (वन्चुँ) गतौ भ्वादिः",
    rom: "vanc (vancuṁ) gatau bhvādiḥ"
  },
  'vanc2_vancuz_curAxiH_pralamBane': {
    dev: "वन्च् (वन्चुँ) प्रलम्भने चुरादिः",
    rom: "vanc (vancuṁ) pralambhane curādiḥ"
  },
  'vap1_duvapaz_BvAxiH_bIjasanwAne': {
    dev: "वप् (डुवपँ) बीजसन्ताने भ्वादिः",
    rom: "vap (ḍuvapaṁ) bījasantāne bhvādiḥ"
  },
  'vaBr1_vaBraz_BvAxiH_gawO': {
    dev: "वभ्र् (वभ्रँ) गतौ भ्वादिः",
    rom: "vabhr (vabhraṁ) gatau bhvādiḥ"
  },
  'vam1_tuvamaz_BvAxiH_uxgiraNe': {
    dev: "वम् (टुवमँ) उद्गिरणे भ्वादिः",
    rom: "vam (ṭuvamaṁ) udgiraṇe bhvādiḥ"
  },
  'vay1_vayaz_BvAxiH_gawO': {
    dev: "वय् (वयँ) गतौ भ्वादिः",
    rom: "vay (vayaṁ) gatau bhvādiḥ"
  },
  'vara1_vara_curAxiH_IpsAyAm': {
    dev: "वर (वर) ईप्सायाम् चुरादिः",
    rom: "vara (vara) īpsāyām curādiḥ"
  },
  'varc1_varcaz_BvAxiH_xIpwO': {
    dev: "वर्च् (वर्चँ) दीप्तौ भ्वादिः",
    rom: "varc (varcaṁ) dīptau bhvādiḥ"
  },
  'varNa1_varNa_curAxiH_guNavacane': {
    dev: "वर्ण (वर्ण) गुणवचने चुरादिः",
    rom: "varṇa (varṇa) guṇavacane curādiḥ"
  },
  'varNa1_varNa_curAxiH_varNakriyAyAm': {
    dev: "वर्ण (वर्ण) वर्णक्रियायाम् चुरादिः",
    rom: "varṇa (varṇa) varṇakriyāyām curādiḥ"
  },
  'varNa1_varNa_curAxiH_viswAre': {
    dev: "वर्ण (वर्ण) विस्तारे चुरादिः",
    rom: "varṇa (varṇa) vistāre curādiḥ"
  },
  'varN1_varNaz_curAxiH_preraNe': {
    dev: "वर्ण् (वर्णँ) प्रेरणे चुरादिः",
    rom: "varṇ (varṇaṁ) preraṇe curādiḥ"
  },
  'varN1_varNaz_curAxiH_varNane': {
    dev: "वर्ण् (वर्णँ) वर्णने चुरादिः",
    rom: "varṇ (varṇaṁ) varṇane curādiḥ"
  },
  'varX1_varXaz_curAxiH_Cexane': {
    dev: "वर्ध् (वर्धँ) छेदने चुरादिः",
    rom: "vardh (vardhaṁ) chedane curādiḥ"
  },
  'varX1_varXaz_curAxiH_pUraNe': {
    dev: "वर्ध् (वर्धँ) पूरणे चुरादिः",
    rom: "vardh (vardhaṁ) pūraṇe curādiḥ"
  },
  'varP1_varPaz_BvAxiH_gawO': {
    dev: "वर्फ् (वर्फँ) गतौ भ्वादिः",
    rom: "varph (varphaṁ) gatau bhvādiḥ"
  },
  'varba1_varba_BvAxiH_gawO': {
    dev: "वर्ब (वर्ब) गतौ भ्वादिः",
    rom: "varba (varba) gatau bhvādiḥ"
  },
  'varR1_varRaz_BvAxiH_snehane': {
    dev: "वर्ष् (वर्षँ) स्नेहने भ्वादिः",
    rom: "varṣ (varṣaṁ) snehane bhvādiḥ"
  },
  'varh1_varhaz_BvAxiH_xAne': {
    dev: "वर्ह् (वर्हँ) दाने भ्वादिः",
    rom: "varh (varhaṁ) dāne bhvādiḥ"
  },
  'varh1_varhaz_BvAxiH_pariBARaNe': {
    dev: "वर्ह् (वर्हँ) परिभाषणे भ्वादिः",
    rom: "varh (varhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'varh2_varhaz_curAxiH_BARArWe': {
    dev: "वर्ह् (वर्हँ) भाषार्थे चुरादिः",
    rom: "varh (varhaṁ) bhāṣārthe curādiḥ"
  },
  'varh1_varhaz_BvAxiH_hiMsAyAm': {
    dev: "वर्ह् (वर्हँ) हिंसायाम् भ्वादिः",
    rom: "varh (varhaṁ) hiṃsāyām bhvādiḥ"
  },
  'val1_valaz_BvAxiH_saMvaraNe': {
    dev: "वल् (वलँ) संवरणे भ्वादिः",
    rom: "val (valaṁ) saṃvaraṇe bhvādiḥ"
  },
  'val1_valaz_BvAxiH_saFcaraNe': {
    dev: "वल् (वलँ) सञ्चरणे भ्वादिः",
    rom: "val (valaṁ) sañcaraṇe bhvādiḥ"
  },
  'valk1_valkaz_curAxiH_pariBARaNe': {
    dev: "वल्क् (वल्कँ) परिभाषणे चुरादिः",
    rom: "valk (valkaṁ) paribhāṣaṇe curādiḥ"
  },
  'valg1_valgaz_BvAxiH_gawO': {
    dev: "वल्ग् (वल्गँ) गतौ भ्वादिः",
    rom: "valg (valgaṁ) gatau bhvādiḥ"
  },
  'valB1_valBaz_BvAxiH_Bojane': {
    dev: "वल्भ् (वल्भँ) भोजने भ्वादिः",
    rom: "valbh (valbhaṁ) bhojane bhvādiḥ"
  },
  'vall1_vallaz_BvAxiH_saMvaraNe': {
    dev: "वल्ल् (वल्लँ) संवरणे भ्वादिः",
    rom: "vall (vallaṁ) saṃvaraṇe bhvādiḥ"
  },
  'vall1_vallaz_BvAxiH_saFcaraNe': {
    dev: "वल्ल् (वल्लँ) सञ्चरणे भ्वादिः",
    rom: "vall (vallaṁ) sañcaraṇe bhvādiḥ"
  },
  'valh1_valhaz_BvAxiH_xAne': {
    dev: "वल्ह् (वल्हँ) दाने भ्वादिः",
    rom: "valh (valhaṁ) dāne bhvādiḥ"
  },
  'valh1_valhaz_BvAxiH_pariBARaNe': {
    dev: "वल्ह् (वल्हँ) परिभाषणे भ्वादिः",
    rom: "valh (valhaṁ) paribhāṣaṇe bhvādiḥ"
  },
  'valh1_valhaz_BvAxiH_prAXAnye': {
    dev: "वल्ह् (वल्हँ) प्राधान्ये भ्वादिः",
    rom: "valh (valhaṁ) prādhānye bhvādiḥ"
  },
  'valh2_valhaz_curAxiH_BARArWe': {
    dev: "वल्ह् (वल्हँ) भाषार्थे चुरादिः",
    rom: "valh (valhaṁ) bhāṣārthe curādiḥ"
  },
  'valh1_valhaz_BvAxiH_hiMsAyAm': {
    dev: "वल्ह् (वल्हँ) हिंसायाम् भ्वादिः",
    rom: "valh (valhaṁ) hiṃsāyām bhvādiḥ"
  },
  'vaS1_vaSaz_axAxiH_kAnwO': {
    dev: "वश् (वशँ) कान्तौ अदादिः",
    rom: "vaś (vaśaṁ) kāntau adādiḥ"
  },
  'vaR1_vaRaz_BvAxiH_hiMsAyAm': {
    dev: "वष् (वषँ) हिंसायाम् भ्वादिः",
    rom: "vaṣ (vaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'vasa1_vasa_curAxiH_nivAse': {
    dev: "वस (वस) निवासे चुरादिः",
    rom: "vasa (vasa) nivāse curādiḥ"
  },
  'vas4_vasaz_curAxiH_apaharaNe': {
    dev: "वस् (वसँ) अपहरणे चुरादिः",
    rom: "vas (vasaṁ) apaharaṇe curādiḥ"
  },
  'vas2_vasaz_axAxiH_AcCAxane': {
    dev: "वस् (वसँ) आच्छादने अदादिः",
    rom: "vas (vasaṁ) ācchādane adādiḥ"
  },
  'vas4_vasaz_curAxiH_Cexane': {
    dev: "वस् (वसँ) छेदने चुरादिः",
    rom: "vas (vasaṁ) chedane curādiḥ"
  },
  'vas1_vasaz_BvAxiH_nivAse': {
    dev: "वस् (वसँ) निवासे भ्वादिः",
    rom: "vas (vasaṁ) nivāse bhvādiḥ"
  },
  'vas4_vasaz_curAxiH_snehane': {
    dev: "वस् (वसँ) स्नेहने चुरादिः",
    rom: "vas (vasaṁ) snehane curādiḥ"
  },
  'vas3_vasuz_xivAxiH_swamBe': {
    dev: "वस् (वसुँ) स्तम्भे दिवादिः",
    rom: "vas (vasuṁ) stambhe divādiḥ"
  },
  'vask1_vaskaz_BvAxiH_gawO': {
    dev: "वस्क् (वस्कँ) गतौ भ्वादिः",
    rom: "vask (vaskaṁ) gatau bhvādiḥ"
  },
  'vah1_vahaz_BvAxiH_prApaNe': {
    dev: "वह् (वहँ) प्रापणे भ्वादिः",
    rom: "vah (vahaṁ) prāpaṇe bhvādiḥ"
  },
  'vah2_vahiz_BvAxiH_vqxXO': {
    dev: "वह् (वहिँ) वृद्धौ भ्वादिः",
    rom: "vah (vahiṁ) vṛddhau bhvādiḥ"
  },
  'vA1_vA_axAxiH_gawO': {
    dev: "वा (वा) गतौ अदादिः",
    rom: "vā (vā) gatau adādiḥ"
  },
  'vA2_vA_curAxiH_gawO': {
    dev: "वा (वा) गतौ चुरादिः",
    rom: "vā (vā) gatau curādiḥ"
  },
  'vA1_vA_axAxiH_ganXane': {
    dev: "वा (वा) गन्धने अदादिः",
    rom: "vā (vā) gandhane adādiḥ"
  },
  'vA2_vA_curAxiH_suKasevane': {
    dev: "वा (वा) सुखसेवने चुरादिः",
    rom: "vā (vā) sukhasevane curādiḥ"
  },
  'vAkR1_vAkRiz_BvAxiH_kAfkRAyAm': {
    dev: "वाक्ष् (वाक्षिँ) काङ्क्षायाम् भ्वादिः",
    rom: "vākṣ (vākṣiṁ) kāṅkṣāyām bhvādiḥ"
  },
  'vAC1_vACiz_BvAxiH_icCAyAm': {
    dev: "वाछ् (वाछिँ) इच्छायाम् भ्वादिः",
    rom: "vāch (vāchiṁ) icchāyām bhvādiḥ"
  },
  'vAd1_vAdqz_BvAxiH_AplAvye': {
    dev: "वाड् (वाडृँ) आप्लाव्ये भ्वादिः",
    rom: "vāḍ (vāḍṛṁ) āplāvye bhvādiḥ"
  },
  'vAwa1_vAwa_curAxiH_suKe': {
    dev: "वात (वात) सुखे चुरादिः",
    rom: "vāta (vāta) sukhe curādiḥ"
  },
  'vAwa1_vAwa_curAxiH_sevane': {
    dev: "वात (वात) सेवने चुरादिः",
    rom: "vāta (vāta) sevane curādiḥ"
  },
  'vAvqw1_vAvqwuz_xivAxiH_varaNe': {
    dev: "वावृत् (वावृतुँ) वरणे दिवादिः",
    rom: "vāvṛt (vāvṛtuṁ) varaṇe divādiḥ"
  },
  'vAS1_vASqz_xivAxiH_Sabxe': {
    dev: "वाश् (वाशृँ) शब्दे दिवादिः",
    rom: "vāś (vāśṛṁ) śabde divādiḥ"
  },
  'vAsa1_vAsa_curAxiH_upasevAyAm': {
    dev: "वास (वास) उपसेवायाम् चुरादिः",
    rom: "vāsa (vāsa) upasevāyām curādiḥ"
  },
  'vAh1_vAhqz_BvAxiH_prayawne': {
    dev: "वाह् (वाहृँ) प्रयत्ने भ्वादिः",
    rom: "vāh (vāhṛṁ) prayatne bhvādiḥ"
  },
  'vic1_vicizr_ruXAxiH_pqWagBAve': {
    dev: "विच् (विचिँर्) पृथग्भावे रुधादिः",
    rom: "vic (viciṁr) pṛthagbhāve rudhādiḥ"
  },
  'viC1_viCaz_wuxAxiH_gawO': {
    dev: "विछ् (विछँ) गतौ तुदादिः",
    rom: "vich (vichaṁ) gatau tudādiḥ"
  },
  'viC2_viCaz_curAxiH_BARArWe': {
    dev: "विछ् (विछँ) भाषार्थे चुरादिः",
    rom: "vich (vichaṁ) bhāṣārthe curādiḥ"
  },
  'viC2_viCaz_curAxiH_BAsArWe': {
    dev: "विछ् (विछँ) भासार्थे चुरादिः",
    rom: "vich (vichaṁ) bhāsārthe curādiḥ"
  },
  'vij2_ozvijIz_wuxAxiH_calane': {
    dev: "विज् (ओँविजीँ) चलने तुदादिः",
    rom: "vij (oṁvijīṁ) calane tudādiḥ"
  },
  'vij2_ozvijIz_wuxAxiH_Baye': {
    dev: "विज् (ओँविजीँ) भये तुदादिः",
    rom: "vij (oṁvijīṁ) bhaye tudādiḥ"
  },
  'vij1_vijizr_juhowyAxiH_pqWagBAve': {
    dev: "विज् (विजिँर्) पृथग्भावे जुहोत्यादिः",
    rom: "vij (vijiṁr) pṛthagbhāve juhotyādiḥ"
  },
  'vit1_vitaz_BvAxiH_AkroSe': {
    dev: "विट् (विटँ) आक्रोशे भ्वादिः",
    rom: "viṭ (viṭaṁ) ākrośe bhvādiḥ"
  },
  'vit1_vitaz_BvAxiH_Sabxe': {
    dev: "विट् (विटँ) शब्दे भ्वादिः",
    rom: "viṭ (viṭaṁ) śabde bhvādiḥ"
  },
  'viwwa1_viwwa_curAxiH_samuwsarge': {
    dev: "वित्त (वित्त) समुत्सर्गे चुरादिः",
    rom: "vitta (vitta) samutsarge curādiḥ"
  },
  'viW1_viWqz_BvAxiH_yAFcAyAm': {
    dev: "विथ् (विथृँ) याञ्चायाम् भ्वादिः",
    rom: "vith (vithṛṁ) yāñcāyām bhvādiḥ"
  },
  'vix5_vixaz_curAxiH_AKyAne': {
    dev: "विद् (विदँ) आख्याने चुरादिः",
    rom: "vid (vidaṁ) ākhyāne curādiḥ"
  },
  'vix5_vixaz_curAxiH_cewane': {
    dev: "विद् (विदँ) चेतने चुरादिः",
    rom: "vid (vidaṁ) cetane curādiḥ"
  },
  'vix1_vixaz_axAxiH_jFAne': {
    dev: "विद् (विदँ) ज्ञाने अदादिः",
    rom: "vid (vidaṁ) jñāne adādiḥ"
  },
  'vix5_vixaz_curAxiH_nivAse': {
    dev: "विद् (विदँ) निवासे चुरादिः",
    rom: "vid (vidaṁ) nivāse curādiḥ"
  },
  'vix4_vixaz_ruXAxiH_vicAraNe': {
    dev: "विद् (विदँ) विचारणे रुधादिः",
    rom: "vid (vidaṁ) vicāraṇe rudhādiḥ"
  },
  'vix5_vixaz_curAxiH_vivAxe': {
    dev: "विद् (विदँ) विवादे चुरादिः",
    rom: "vid (vidaṁ) vivāde curādiḥ"
  },
  'vix5_vixaz_curAxiH_vexanAyAm': {
    dev: "विद् (विदँ) वेदनायाम् चुरादिः",
    rom: "vid (vidaṁ) vedanāyām curādiḥ"
  },
  'vix2_vixaz_xivAxiH_sawwAyAm': {
    dev: "विद् (विदँ) सत्तायाम् दिवादिः",
    rom: "vid (vidaṁ) sattāyām divādiḥ"
  },
  'vix3_vixLz_wuxAxiH_lABe': {
    dev: "विद् (विदॢँ) लाभे तुदादिः",
    rom: "vid (vidḷṁ) lābhe tudādiḥ"
  },
  'viX1_viXaz_wuxAxiH_viXAne': {
    dev: "विध् (विधँ) विधाने तुदादिः",
    rom: "vidh (vidhaṁ) vidhāne tudādiḥ"
  },
  'vil2_vilaz_curAxiH_kRepe': {
    dev: "विल् (विलँ) क्षेपे चुरादिः",
    rom: "vil (vilaṁ) kṣepe curādiḥ"
  },
  'vil1_vilaz_wuxAxiH_saMvaraNe': {
    dev: "विल् (विलँ) संवरणे तुदादिः",
    rom: "vil (vilaṁ) saṃvaraṇe tudādiḥ"
  },
  'viS1_viSaz_wuxAxiH_praveSane': {
    dev: "विश् (विशँ) प्रवेशने तुदादिः",
    rom: "viś (viśaṁ) praveśane tudādiḥ"
  },
  'viR3_viRaz_kryAxiH_viprayoge': {
    dev: "विष् (विषँ) विप्रयोगे क्र्यादिः",
    rom: "viṣ (viṣaṁ) viprayoge kryādiḥ"
  },
  'viR1_viRuz_BvAxiH_secane': {
    dev: "विष् (विषुँ) सेचने भ्वादिः",
    rom: "viṣ (viṣuṁ) secane bhvādiḥ"
  },
  'viR1_viRuz_BvAxiH_sevane': {
    dev: "विष् (विषुँ) सेवने भ्वादिः",
    rom: "viṣ (viṣuṁ) sevane bhvādiḥ"
  },
  'viR2_viRLz_juhowyAxiH_vyApwO': {
    dev: "विष् (विषॢँ) व्याप्तौ जुहोत्यादिः",
    rom: "viṣ (viṣḷṁ) vyāptau juhotyādiḥ"
  },
  'viRka1_viRka_curAxiH_xarSane': {
    dev: "विष्क (विष्क) दर्शने चुरादिः",
    rom: "viṣka (viṣka) darśane curādiḥ"
  },
  'viRk1_viRkaz_curAxiH_hiMsAyAm': {
    dev: "विष्क् (विष्कँ) हिंसायाम् चुरादिः",
    rom: "viṣk (viṣkaṁ) hiṃsāyām curādiḥ"
  },
  'vis1_visaz_xivAxiH_preraNe': {
    dev: "विस् (विसँ) प्रेरणे दिवादिः",
    rom: "vis (visaṁ) preraṇe divādiḥ"
  },
  'vI1_vI_axAxiH_asane': {
    dev: "वी (वी) असने अदादिः",
    rom: "vī (vī) asane adādiḥ"
  },
  'vI1_vI_axAxiH_kAnwO': {
    dev: "वी (वी) कान्तौ अदादिः",
    rom: "vī (vī) kāntau adādiḥ"
  },
  'vI1_vI_axAxiH_KAxane': {
    dev: "वी (वी) खादने अदादिः",
    rom: "vī (vī) khādane adādiḥ"
  },
  'vI1_vI_axAxiH_gawO': {
    dev: "वी (वी) गतौ अदादिः",
    rom: "vī (vī) gatau adādiḥ"
  },
  'vI1_vI_axAxiH_prajane': {
    dev: "वी (वी) प्रजने अदादिः",
    rom: "vī (vī) prajane adādiḥ"
  },
  'vIra1_vIra_curAxiH_vikrAnwO': {
    dev: "वीर (वीर) विक्रान्तौ चुरादिः",
    rom: "vīra (vīra) vikrāntau curādiḥ"
  },
  'vug1_vugiz_BvAxiH_varjane': {
    dev: "वुग् (वुगिँ) वर्जने भ्वादिः",
    rom: "vug (vugiṁ) varjane bhvādiḥ"
  },
  'vq2_vqf_kryAxiH_samBakwO': {
    dev: "वृ (वृङ्) सम्भक्तौ क्र्यादिः",
    rom: "vṛ (vṛṅ) sambhaktau kryādiḥ"
  },
  'vq3_vqF_curAxiH_AvaraNe': {
    dev: "वृ (वृञ्) आवरणे चुरादिः",
    rom: "vṛ (vṛñ) āvaraṇe curādiḥ"
  },
  'vq1_vqF_svAxiH_varaNe': {
    dev: "वृ (वृञ्) वरणे स्वादिः",
    rom: "vṛ (vṛñ) varaṇe svādiḥ"
  },
  'vqk1_vqkaz_BvAxiH_AxAne': {
    dev: "वृक् (वृकँ) आदाने भ्वादिः",
    rom: "vṛk (vṛkaṁ) ādāne bhvādiḥ"
  },
  'vqkR1_vqkRaz_BvAxiH_varaNe': {
    dev: "वृक्ष् (वृक्षँ) वरणे भ्वादिः",
    rom: "vṛkṣ (vṛkṣaṁ) varaṇe bhvādiḥ"
  },
  'vqj1_vqjaz_BvAxiH_gawO': {
    dev: "वृज् (वृजँ) गतौ भ्वादिः",
    rom: "vṛj (vṛjaṁ) gatau bhvādiḥ"
  },
  'vqj2_vqjIz_axAxiH_varjane': {
    dev: "वृज् (वृजीँ) वर्जने अदादिः",
    rom: "vṛj (vṛjīṁ) varjane adādiḥ"
  },
  'vqj4_vqjIz_curAxiH_varjane': {
    dev: "वृज् (वृजीँ) वर्जने चुरादिः",
    rom: "vṛj (vṛjīṁ) varjane curādiḥ"
  },
  'vqj3_vqjIz_ruXAxiH_varjane': {
    dev: "वृज् (वृजीँ) वर्जने रुधादिः",
    rom: "vṛj (vṛjīṁ) varjane rudhādiḥ"
  },
  'vqw3_vqwuz_curAxiH_BARArWe': {
    dev: "वृत् (वृतुँ) भाषार्थे चुरादिः",
    rom: "vṛt (vṛtuṁ) bhāṣārthe curādiḥ"
  },
  'vqw3_vqwuz_curAxiH_BAsArWe': {
    dev: "वृत् (वृतुँ) भासार्थे चुरादिः",
    rom: "vṛt (vṛtuṁ) bhāsārthe curādiḥ"
  },
  'vqw2_vqwuz_xivAxiH_varaNe': {
    dev: "वृत् (वृतुँ) वरणे दिवादिः",
    rom: "vṛt (vṛtuṁ) varaṇe divādiḥ"
  },
  'vqw1_vqwuz_BvAxiH_varwane': {
    dev: "वृत् (वृतुँ) वर्तने भ्वादिः",
    rom: "vṛt (vṛtuṁ) vartane bhvādiḥ"
  },
  'vqX2_vqXuz_curAxiH_BARArWe': {
    dev: "वृध् (वृधुँ) भाषार्थे चुरादिः",
    rom: "vṛdh (vṛdhuṁ) bhāṣārthe curādiḥ"
  },
  'vqX2_vqXuz_curAxiH_BAsArWe': {
    dev: "वृध् (वृधुँ) भासार्थे चुरादिः",
    rom: "vṛdh (vṛdhuṁ) bhāsārthe curādiḥ"
  },
  'vqX1_vqXuz_BvAxiH_vqxXO': {
    dev: "वृध् (वृधुँ) वृद्धौ भ्वादिः",
    rom: "vṛdh (vṛdhuṁ) vṛddhau bhvādiḥ"
  },
  'vqS1_vqSaz_xivAxiH_varaNe': {
    dev: "वृश् (वृशँ) वरणे दिवादिः",
    rom: "vṛś (vṛśaṁ) varaṇe divādiḥ"
  },
  'vqR2_vqRaz_curAxiH_SakwibanXane': {
    dev: "वृष् (वृषँ) शक्तिबन्धने चुरादिः",
    rom: "vṛṣ (vṛṣaṁ) śaktibandhane curādiḥ"
  },
  'vqR3_vqRuz_curAxiH_SakwisambanXe': {
    dev: "वृष् (वृषुँ) शक्तिसम्बन्धे चुरादिः",
    rom: "vṛṣ (vṛṣuṁ) śaktisambandhe curādiḥ"
  },
  'vqR1_vqRuz_BvAxiH_secane': {
    dev: "वृष् (वृषुँ) सेचने भ्वादिः",
    rom: "vṛṣ (vṛṣuṁ) secane bhvādiḥ"
  },
  'vqh1_vqhaz_BvAxiH_vqxXO': {
    dev: "वृह् (वृहँ) वृद्धौ भ्वादिः",
    rom: "vṛh (vṛhaṁ) vṛddhau bhvādiḥ"
  },
  'vqh4_vqhiz_curAxiH_BARArWe': {
    dev: "वृह् (वृहिँ) भाषार्थे चुरादिः",
    rom: "vṛh (vṛhiṁ) bhāṣārthe curādiḥ"
  },
  'vqh2_vqhiz_BvAxiH_vqxXO': {
    dev: "वृह् (वृहिँ) वृद्धौ भ्वादिः",
    rom: "vṛh (vṛhiṁ) vṛddhau bhvādiḥ"
  },
  'vqh2_vqhiz_BvAxiH_Sabxe': {
    dev: "वृह् (वृहिँ) शब्दे भ्वादिः",
    rom: "vṛh (vṛhiṁ) śabde bhvādiḥ"
  },
  'vqh3_vqhUz_wuxAxiH_uxyamane': {
    dev: "वृह् (वृहूँ) उद्यमने तुदादिः",
    rom: "vṛh (vṛhūṁ) udyamane tudādiḥ"
  },
  'vQ2_vQ_kryAxiH_BaraNe': {
    dev: "वॄ (वॄ) भरणे क्र्यादिः",
    rom: "vṝ (vṝ) bharaṇe kryādiḥ"
  },
  'vQ2_vQ_kryAxiH_varaNe': {
    dev: "वॄ (वॄ) वरणे क्र्यादिः",
    rom: "vṝ (vṝ) varaṇe kryādiḥ"
  },
  'vQ1_vQF_kryAxiH_varaNe': {
    dev: "वॄ (वॄञ्) वरणे क्र्यादिः",
    rom: "vṝ (vṝñ) varaṇe kryādiḥ"
  },
  've1_veF_BvAxiH_wanwusanwAne': {
    dev: "वे (वेञ्) तन्तुसन्ताने भ्वादिः",
    rom: "ve (veñ) tantusantāne bhvādiḥ"
  },
  'veN1_veNqz_BvAxiH_gawO': {
    dev: "वेण् (वेणृँ) गतौ भ्वादिः",
    rom: "veṇ (veṇṛṁ) gatau bhvādiḥ"
  },
  'veN1_veNqz_BvAxiH_cinwAyAm': {
    dev: "वेण् (वेणृँ) चिन्तायाम् भ्वादिः",
    rom: "veṇ (veṇṛṁ) cintāyām bhvādiḥ"
  },
  'veN1_veNqz_BvAxiH_jFAne': {
    dev: "वेण् (वेणृँ) ज्ञाने भ्वादिः",
    rom: "veṇ (veṇṛṁ) jñāne bhvādiḥ"
  },
  'veN1_veNqz_BvAxiH_niSAmane': {
    dev: "वेण् (वेणृँ) निशामने भ्वादिः",
    rom: "veṇ (veṇṛṁ) niśāmane bhvādiḥ"
  },
  'veN1_veNqz_BvAxiH_vAxiwragrahaNe': {
    dev: "वेण् (वेणृँ) वादित्रग्रहणे भ्वादिः",
    rom: "veṇ (veṇṛṁ) vāditragrahaṇe bhvādiḥ"
  },
  'veW1_veWqz_BvAxiH_yAFcAyAm': {
    dev: "वेथ् (वेथृँ) याञ्चायाम् भ्वादिः",
    rom: "veth (vethṛṁ) yāñcāyām bhvādiḥ"
  },
  'vep1_tuvepqz_BvAxiH_kampane': {
    dev: "वेप् (टुवेपृँ) कम्पने भ्वादिः",
    rom: "vep (ṭuvepṛṁ) kampane bhvādiḥ"
  },
  'vela1_vela_curAxiH_kAlopaxeSe': {
    dev: "वेल (वेल) कालोपदेशे चुरादिः",
    rom: "vela (vela) kālopadeśe curādiḥ"
  },
  'vela1_vela_curAxiH_kAlopayoge': {
    dev: "वेल (वेल) कालोपयोगे चुरादिः",
    rom: "vela (vela) kālopayoge curādiḥ"
  },
  'vel1_velqz_BvAxiH_calane': {
    dev: "वेल् (वेलृँ) चलने भ्वादिः",
    rom: "vel (velṛṁ) calane bhvādiḥ"
  },
  'vell1_vellaz_BvAxiH_calane': {
    dev: "वेल्ल् (वेल्लँ) चलने भ्वादिः",
    rom: "vell (vellaṁ) calane bhvādiḥ"
  },
  'vell2_vellqz_BvAxiH_calane': {
    dev: "वेल्ल् (वेल्लृँ) चलने भ्वादिः",
    rom: "vell (vellṛṁ) calane bhvādiḥ"
  },
  'vevI1_vevIf_axAxiH_vewinA_wulye': {
    dev: "वेवी (वेवीङ्) वेतिना_तुल्ये अदादिः",
    rom: "vevī (vevīṅ) vetinā_tulye adādiḥ"
  },
  'veRt1_veRtaz_BvAxiH_veRtane': {
    dev: "वेष्ट् (वेष्टँ) वेष्टने भ्वादिः",
    rom: "veṣṭ (veṣṭaṁ) veṣṭane bhvādiḥ"
  },
  'veh1_vehqz_BvAxiH_prayawne': {
    dev: "वेह् (वेहृँ) प्रयत्ने भ्वादिः",
    rom: "veh (vehṛṁ) prayatne bhvādiḥ"
  },
  'vE1_ozvE_BvAxiH_SoRaNe': {
    dev: "वै (ओँवै) शोषणे भ्वादिः",
    rom: "vai (oṁvai) śoṣaṇe bhvādiḥ"
  },
  'vyac1_vyacaz_wuxAxiH_vyAjIkaraNe': {
    dev: "व्यच् (व्यचँ) व्याजीकरणे तुदादिः",
    rom: "vyac (vyacaṁ) vyājīkaraṇe tudādiḥ"
  },
  'vyac1_vyacaz_wuxAxiH_samBave': {
    dev: "व्यच् (व्यचँ) सम्भवे तुदादिः",
    rom: "vyac (vyacaṁ) sambhave tudādiḥ"
  },
  'vyaj1_vyajaz_wuxAxiH_vyAjIkaraNe': {
    dev: "व्यज् (व्यजँ) व्याजीकरणे तुदादिः",
    rom: "vyaj (vyajaṁ) vyājīkaraṇe tudādiḥ"
  },
  'vyaW1_vyaWaz_BvAxiH_calane': {
    dev: "व्यथ् (व्यथँ) चलने भ्वादिः",
    rom: "vyath (vyathaṁ) calane bhvādiḥ"
  },
  'vyaW1_vyaWaz_BvAxiH_Baye': {
    dev: "व्यथ् (व्यथँ) भये भ्वादिः",
    rom: "vyath (vyathaṁ) bhaye bhvādiḥ"
  },
  'vyaW1_vyaWaz_BvAxiH_saFcalane': {
    dev: "व्यथ् (व्यथँ) सञ्चलने भ्वादिः",
    rom: "vyath (vyathaṁ) sañcalane bhvādiḥ"
  },
  'vyaX1_vyaXaz_xivAxiH_wAdane': {
    dev: "व्यध् (व्यधँ) ताडने दिवादिः",
    rom: "vyadh (vyadhaṁ) tāḍane divādiḥ"
  },
  'vyaya1_vyaya_curAxiH_gawO': {
    dev: "व्यय (व्यय) गतौ चुरादिः",
    rom: "vyaya (vyaya) gatau curādiḥ"
  },
  'vyaya1_vyaya_curAxiH_viwwasamuwsarge': {
    dev: "व्यय (व्यय) वित्तसमुत्सर्गे चुरादिः",
    rom: "vyaya (vyaya) vittasamutsarge curādiḥ"
  },
  'vyay2_vyayaz_curAxiH_kRaye': {
    dev: "व्यय् (व्ययँ) क्षये चुरादिः",
    rom: "vyay (vyayaṁ) kṣaye curādiḥ"
  },
  'vyay1_vyayaz_BvAxiH_gawO': {
    dev: "व्यय् (व्ययँ) गतौ भ्वादिः",
    rom: "vyay (vyayaṁ) gatau bhvādiḥ"
  },
  'vyuR1_vyuRaz_xivAxiH_xAhe': {
    dev: "व्युष् (व्युषँ) दाहे दिवादिः",
    rom: "vyuṣ (vyuṣaṁ) dāhe divādiḥ"
  },
  'vyuR1_vyuRaz_xivAxiH_viBAge': {
    dev: "व्युष् (व्युषँ) विभागे दिवादिः",
    rom: "vyuṣ (vyuṣaṁ) vibhāge divādiḥ"
  },
  'vye1_vyeF_BvAxiH_saMvaraNe': {
    dev: "व्ये (व्येञ्) संवरणे भ्वादिः",
    rom: "vye (vyeñ) saṃvaraṇe bhvādiḥ"
  },
  'vraj2_vrajaz_curAxiH_gawO': {
    dev: "व्रज् (व्रजँ) गतौ चुरादिः",
    rom: "vraj (vrajaṁ) gatau curādiḥ"
  },
  'vraj1_vrajaz_BvAxiH_gawO': {
    dev: "व्रज् (व्रजँ) गतौ भ्वादिः",
    rom: "vraj (vrajaṁ) gatau bhvādiḥ"
  },
  'vraj2_vrajaz_curAxiH_mArgasaMskAre': {
    dev: "व्रज् (व्रजँ) मार्गसंस्कारे चुरादिः",
    rom: "vraj (vrajaṁ) mārgasaṃskāre curādiḥ"
  },
  'vraNa1_vraNa_curAxiH_gAwravicUrNane': {
    dev: "व्रण (व्रण) गात्रविचूर्णने चुरादिः",
    rom: "vraṇa (vraṇa) gātravicūrṇane curādiḥ"
  },
  'vraN1_vraNaz_BvAxiH_Sabxe': {
    dev: "व्रण् (व्रणँ) शब्दे भ्वादिः",
    rom: "vraṇ (vraṇaṁ) śabde bhvādiḥ"
  },
  'vrasc1_ozvrascUz_wuxAxiH_Cexane': {
    dev: "व्रस्च् (ओँव्रस्चूँ) छेदने तुदादिः",
    rom: "vrasc (oṁvrascūṁ) chedane tudādiḥ"
  },
  'vrI2_vrI_kryAxiH_varaNe': {
    dev: "व्री (व्री) वरणे क्र्यादिः",
    rom: "vrī (vrī) varaṇe kryādiḥ"
  },
  'vrI1_vrIf_xivAxiH_vqNowyarWe': {
    dev: "व्री (व्रीङ्) वृणोत्यर्थे दिवादिः",
    rom: "vrī (vrīṅ) vṛṇotyarthe divādiḥ"
  },
  'vrId1_vrIdaz_xivAxiH_coxane': {
    dev: "व्रीड् (व्रीडँ) चोदने दिवादिः",
    rom: "vrīḍ (vrīḍaṁ) codane divādiḥ"
  },
  'vrud1_vrudaz_wuxAxiH_saMvaraNe': {
    dev: "व्रुड् (व्रुडँ) संवरणे तुदादिः",
    rom: "vruḍ (vruḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'vlI1_vlI_kryAxiH_varaNe': {
    dev: "व्ली (व्ली) वरणे क्र्यादिः",
    rom: "vlī (vlī) varaṇe kryādiḥ"
  },
  'Sak2_Sakaz_xivAxiH_viBARiwo_marRaNe': {
    dev: "शक् (शकँ) विभाषितो_मर्षणे दिवादिः",
    rom: "śak (śakaṁ) vibhāṣito_marṣaṇe divādiḥ"
  },
  'Sak1_Sakiz_BvAxiH_SafkAyAm': {
    dev: "शक् (शकिँ) शङ्कायाम् भ्वादिः",
    rom: "śak (śakiṁ) śaṅkāyām bhvādiḥ"
  },
  'Sak3_SakLz_svAxiH_SakwO': {
    dev: "शक् (शकॢँ) शक्तौ स्वादिः",
    rom: "śak (śakḷṁ) śaktau svādiḥ"
  },
  'Sac1_Sacaz_BvAxiH_vyakwAyAM_vAci': {
    dev: "शच् (शचँ) व्यक्तायां_वाचि भ्वादिः",
    rom: "śac (śacaṁ) vyaktāyāṃ_vāci bhvādiḥ"
  },
  'Sat1_Sataz_BvAxiH_avasAxane': {
    dev: "शट् (शटँ) अवसादने भ्वादिः",
    rom: "śaṭ (śaṭaṁ) avasādane bhvādiḥ"
  },
  'Sat1_Sataz_BvAxiH_gawO': {
    dev: "शट् (शटँ) गतौ भ्वादिः",
    rom: "śaṭ (śaṭaṁ) gatau bhvādiḥ"
  },
  'Sat1_Sataz_BvAxiH_rujAyAm': {
    dev: "शट् (शटँ) रुजायाम् भ्वादिः",
    rom: "śaṭ (śaṭaṁ) rujāyām bhvādiḥ"
  },
  'Sat1_Sataz_BvAxiH_viSaraNe': {
    dev: "शट् (शटँ) विशरणे भ्वादिः",
    rom: "śaṭ (śaṭaṁ) viśaraṇe bhvādiḥ"
  },
  'SaTa1_SaTa_curAxiH_samyagABARaNe': {
    dev: "शठ (शठ) सम्यगाभाषणे चुरादिः",
    rom: "śaṭha (śaṭha) samyagābhāṣaṇe curādiḥ"
  },
  'SaT2_SaTaz_curAxiH_asaMskAre': {
    dev: "शठ् (शठँ) असंस्कारे चुरादिः",
    rom: "śaṭh (śaṭhaṁ) asaṃskāre curādiḥ"
  },
  'SaT1_SaTaz_BvAxiH_kEwave': {
    dev: "शठ् (शठँ) कैतवे भ्वादिः",
    rom: "śaṭh (śaṭhaṁ) kaitave bhvādiḥ"
  },
  'SaT2_SaTaz_curAxiH_gawO': {
    dev: "शठ् (शठँ) गतौ चुरादिः",
    rom: "śaṭh (śaṭhaṁ) gatau curādiḥ"
  },
  'SaT2_SaTaz_curAxiH_SlAGAyAm': {
    dev: "शठ् (शठँ) श्लाघायाम् चुरादिः",
    rom: "śaṭh (śaṭhaṁ) ślāghāyām curādiḥ"
  },
  'SaT1_SaTaz_BvAxiH_safkleSane': {
    dev: "शठ् (शठँ) सङ्क्लेशने भ्वादिः",
    rom: "śaṭh (śaṭhaṁ) saṅkleśane bhvādiḥ"
  },
  'SaT1_SaTaz_BvAxiH_hiMsAyAm': {
    dev: "शठ् (शठँ) हिंसायाम् भ्वादिः",
    rom: "śaṭh (śaṭhaṁ) hiṃsāyām bhvādiḥ"
  },
  'Sad1_Sadiz_BvAxiH_rujAyAm': {
    dev: "शड् (शडिँ) रुजायाम् भ्वादिः",
    rom: "śaḍ (śaḍiṁ) rujāyām bhvādiḥ"
  },
  'Sad1_Sadiz_BvAxiH_safGAwe': {
    dev: "शड् (शडिँ) सङ्घाते भ्वादिः",
    rom: "śaḍ (śaḍiṁ) saṅghāte bhvādiḥ"
  },
  'SaN1_SaNaz_BvAxiH_gawO': {
    dev: "शण् (शणँ) गतौ भ्वादिः",
    rom: "śaṇ (śaṇaṁ) gatau bhvādiḥ"
  },
  'SaN1_SaNaz_BvAxiH_xAne': {
    dev: "शण् (शणँ) दाने भ्वादिः",
    rom: "śaṇ (śaṇaṁ) dāne bhvādiḥ"
  },
  'Sax2_SaxLz_wuxAxiH_SAwane': {
    dev: "शद् (शदॢँ) शातने तुदादिः",
    rom: "śad (śadḷṁ) śātane tudādiḥ"
  },
  'Sax1_SaxLz_BvAxiH_SAwane': {
    dev: "शद् (शदॢँ) शातने भ्वादिः",
    rom: "śad (śadḷṁ) śātane bhvādiḥ"
  },
  'Sanb1_Sanbaz_curAxiH_sambanXe': {
    dev: "शन्ब् (शन्बँ) सम्बन्धे चुरादिः",
    rom: "śanb (śanbaṁ) sambandhe curādiḥ"
  },
  'Sans1_Sansuz_BvAxiH_swuwO': {
    dev: "शन्स् (शन्सुँ) स्तुतौ भ्वादिः",
    rom: "śans (śansuṁ) stutau bhvādiḥ"
  },
  'Sap2_Sapaz_xivAxiH_AkroSe': {
    dev: "शप् (शपँ) आक्रोशे दिवादिः",
    rom: "śap (śapaṁ) ākrośe divādiḥ"
  },
  'Sap1_Sapaz_BvAxiH_AkroSe': {
    dev: "शप् (शपँ) आक्रोशे भ्वादिः",
    rom: "śap (śapaṁ) ākrośe bhvādiḥ"
  },
  'Sabx1_Sabxaz_curAxiH_upasargAxAviRkAre': {
    dev: "शब्द् (शब्दँ) उपसर्गादाविष्कारे चुरादिः",
    rom: "śabd (śabdaṁ) upasargādāviṣkāre curādiḥ"
  },
  'Sabx1_Sabxaz_curAxiH_SabxakriyAyAm': {
    dev: "शब्द् (शब्दँ) शब्दक्रियायाम् चुरादिः",
    rom: "śabd (śabdaṁ) śabdakriyāyām curādiḥ"
  },
  'Sam2_Samaz_curAxiH_Alocane': {
    dev: "शम् (शमँ) आलोचने चुरादिः",
    rom: "śam (śamaṁ) ālocane curādiḥ"
  },
  'Sam1_Samuz_xivAxiH_upaSamane': {
    dev: "शम् (शमुँ) उपशमने दिवादिः",
    rom: "śam (śamuṁ) upaśamane divādiḥ"
  },
  'Sarb1_Sarbaz_BvAxiH_gawO': {
    dev: "शर्ब् (शर्बँ) गतौ भ्वादिः",
    rom: "śarb (śarbaṁ) gatau bhvādiḥ"
  },
  'Sarv1_Sarvaz_BvAxiH_hiMsAyAm': {
    dev: "शर्व् (शर्वँ) हिंसायाम् भ्वादिः",
    rom: "śarv (śarvaṁ) hiṃsāyām bhvādiḥ"
  },
  'Sal2_Salaz_BvAxiH_ASugamane': {
    dev: "शल् (शलँ) आशुगमने भ्वादिः",
    rom: "śal (śalaṁ) āśugamane bhvādiḥ"
  },
  'Sal2_Salaz_BvAxiH_gawO': {
    dev: "शल् (शलँ) गतौ भ्वादिः",
    rom: "śal (śalaṁ) gatau bhvādiḥ"
  },
  'Sal1_Salaz_BvAxiH_calane': {
    dev: "शल् (शलँ) चलने भ्वादिः",
    rom: "śal (śalaṁ) calane bhvādiḥ"
  },
  'Sal1_Salaz_BvAxiH_saMvaraNe': {
    dev: "शल् (शलँ) संवरणे भ्वादिः",
    rom: "śal (śalaṁ) saṃvaraṇe bhvādiḥ"
  },
  'SalB1_SalBaz_BvAxiH_kawWane': {
    dev: "शल्भ् (शल्भँ) कत्थने भ्वादिः",
    rom: "śalbh (śalbhaṁ) katthane bhvādiḥ"
  },
  'Sav1_Savaz_BvAxiH_gawO': {
    dev: "शव् (शवँ) गतौ भ्वादिः",
    rom: "śav (śavaṁ) gatau bhvādiḥ"
  },
  'SaS1_SaSaz_BvAxiH_pluwagawO': {
    dev: "शश् (शशँ) प्लुतगतौ भ्वादिः",
    rom: "śaś (śaśaṁ) plutagatau bhvādiḥ"
  },
  'SaR1_SaRaz_BvAxiH_hiMsAyAm': {
    dev: "शष् (शषँ) हिंसायाम् भ्वादिः",
    rom: "śaṣ (śaṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'Sas1_Sasuz_BvAxiH_hiMsAyAm': {
    dev: "शस् (शसुँ) हिंसायाम् भ्वादिः",
    rom: "śas (śasuṁ) hiṃsāyām bhvādiḥ"
  },
  'Sas1_Sasiz_BvAxiH_icCAyAm': {
    dev: "शस् (शसिँ) इच्छायाम् भ्वादिः",
    rom: "śas (śasiṁ) icchāyām bhvādiḥ"
  },
  'SAK1_SAKqz_BvAxiH_vyApwO': {
    dev: "शाख् (शाखृँ) व्याप्तौ भ्वादिः",
    rom: "śākh (śākhṛṁ) vyāptau bhvādiḥ"
  },
  'SAd1_SAdqz_BvAxiH_SlAGAyAm': {
    dev: "शाड् (शाडृँ) श्लाघायाम् भ्वादिः",
    rom: "śāḍ (śāḍṛṁ) ślāghāyām bhvādiḥ"
  },
  'SAn1_SAnaz_BvAxiH_wejane': {
    dev: "शान् (शानँ) तेजने भ्वादिः",
    rom: "śān (śānaṁ) tejane bhvādiḥ"
  },
  'SAra1_SAra_curAxiH_xOrbalye': {
    dev: "शार (शार) दौर्बल्ये चुरादिः",
    rom: "śāra (śāra) daurbalye curādiḥ"
  },
  'SAs1_SAsuz_axAxiH_anuSiRtO': {
    dev: "शास् (शासुँ) अनुशिष्टौ अदादिः",
    rom: "śās (śāsuṁ) anuśiṣṭau adādiḥ"
  },
  'SAs1_SAsuz_axAxiH_icCAyAm': {
    dev: "शास् (शासुँ) इच्छायाम् अदादिः",
    rom: "śās (śāsuṁ) icchāyām adādiḥ"
  },
  'Si1_SiF_svAxiH_niSAne': {
    dev: "शि (शिञ्) निशाने स्वादिः",
    rom: "śi (śiñ) niśāne svādiḥ"
  },
  'SikR1_SikRaz_BvAxiH_vixyopAxAne': {
    dev: "शिक्ष् (शिक्षँ) विद्योपादाने भ्वादिः",
    rom: "śikṣ (śikṣaṁ) vidyopādāne bhvādiḥ"
  },
  'SiG1_SiGiz_BvAxiH_AGrANe': {
    dev: "शिघ् (शिघिँ) आघ्राणे भ्वादिः",
    rom: "śigh (śighiṁ) āghrāṇe bhvādiḥ"
  },
  'Sij1_Sijiz_axAxiH_avyakwe_Sabxe': {
    dev: "शिज् (शिजिँ) अव्यक्ते_शब्दे अदादिः",
    rom: "śij (śijiṁ) avyakte_śabde adādiḥ"
  },
  'Sit1_Sitaz_BvAxiH_anAxare': {
    dev: "शिट् (शिटँ) अनादरे भ्वादिः",
    rom: "śiṭ (śiṭaṁ) anādare bhvādiḥ"
  },
  'Sil1_Silaz_wuxAxiH_uFCe': {
    dev: "शिल् (शिलँ) उञ्छे तुदादिः",
    rom: "śil (śilaṁ) uñche tudādiḥ"
  },
  'SiR3_SiRaz_curAxiH_asarvopayoge': {
    dev: "शिष् (शिषँ) असर्वोपयोगे चुरादिः",
    rom: "śiṣ (śiṣaṁ) asarvopayoge curādiḥ"
  },
  'SiR1_SiRaz_BvAxiH_hiMsAyAm': {
    dev: "शिष् (शिषँ) हिंसायाम् भ्वादिः",
    rom: "śiṣ (śiṣaṁ) hiṃsāyām bhvādiḥ"
  },
  'SiR2_SiRLz_ruXAxiH_viSeRaNe': {
    dev: "शिष् (शिषॢँ) विशेषणे रुधादिः",
    rom: "śiṣ (śiṣḷṁ) viśeṣaṇe rudhādiḥ"
  },
  'SI1_SIf_axAxiH_svapne': {
    dev: "शी (शीङ्) स्वप्ने अदादिः",
    rom: "śī (śīṅ) svapne adādiḥ"
  },
  'SIk2_SIkaz_curAxiH_AmarRaNe': {
    dev: "शीक् (शीकँ) आमर्षणे चुरादिः",
    rom: "śīk (śīkaṁ) āmarṣaṇe curādiḥ"
  },
  'SIk2_SIkaz_curAxiH_BARArWe': {
    dev: "शीक् (शीकँ) भाषार्थे चुरादिः",
    rom: "śīk (śīkaṁ) bhāṣārthe curādiḥ"
  },
  'SIk2_SIkaz_curAxiH_marRaNe': {
    dev: "शीक् (शीकँ) मर्षणे चुरादिः",
    rom: "śīk (śīkaṁ) marṣaṇe curādiḥ"
  },
  'SIk1_SIkqz_BvAxiH_gawO': {
    dev: "शीक् (शीकृँ) गतौ भ्वादिः",
    rom: "śīk (śīkṛṁ) gatau bhvādiḥ"
  },
  'SIk1_SIkqz_BvAxiH_secane': {
    dev: "शीक् (शीकृँ) सेचने भ्वादिः",
    rom: "śīk (śīkṛṁ) secane bhvādiḥ"
  },
  'SIB1_SIBqz_BvAxiH_kawWane': {
    dev: "शीभ् (शीभृँ) कत्थने भ्वादिः",
    rom: "śībh (śībhṛṁ) katthane bhvādiḥ"
  },
  'SIla1_SIla_curAxiH_upaXAraNe': {
    dev: "शील (शील) उपधारणे चुरादिः",
    rom: "śīla (śīla) upadhāraṇe curādiḥ"
  },
  'SIl1_SIlaz_BvAxiH_nimeRaNe': {
    dev: "शील् (शीलँ) निमेषणे भ्वादिः",
    rom: "śīl (śīlaṁ) nimeṣaṇe bhvādiḥ"
  },
  'SIl1_SIlaz_BvAxiH_samAXO': {
    dev: "शील् (शीलँ) समाधौ भ्वादिः",
    rom: "śīl (śīlaṁ) samādhau bhvādiḥ"
  },
  'Su1_Su_BvAxiH_gawO': {
    dev: "शु (शु) गतौ भ्वादिः",
    rom: "śu (śu) gatau bhvādiḥ"
  },
  'Suk1_Sukaz_BvAxiH_gawO': {
    dev: "शुक् (शुकँ) गतौ भ्वादिः",
    rom: "śuk (śukaṁ) gatau bhvādiḥ"
  },
  'Sukl1_Suklaz_curAxiH_awisparSane': {
    dev: "शुक्ल् (शुक्लँ) अतिस्पर्शने चुरादिः",
    rom: "śukl (śuklaṁ) atisparśane curādiḥ"
  },
  'Suc2_IzSucizr_xivAxiH_pUwIBAve': {
    dev: "शुच् (ईँशुचिँर्) पूतीभावे दिवादिः",
    rom: "śuc (īṁśuciṁr) pūtībhāve divādiḥ"
  },
  'Suc1_Sucaz_BvAxiH_Soke': {
    dev: "शुच् (शुचँ) शोके भ्वादिः",
    rom: "śuc (śucaṁ) śoke bhvādiḥ"
  },
  'Sucy1_Sucyaz_BvAxiH_aBiRave': {
    dev: "शुच्य् (शुच्यँ) अभिषवे भ्वादिः",
    rom: "śucy (śucyaṁ) abhiṣave bhvādiḥ"
  },
  'Sucy2_SucyIz_BvAxiH_aBiRave': {
    dev: "शुच्य् (शुच्यीँ) अभिषवे भ्वादिः",
    rom: "śucy (śucyīṁ) abhiṣave bhvādiḥ"
  },
  'SuT3_SuTaz_curAxiH_Alasye': {
    dev: "शुठ् (शुठँ) आलस्ये चुरादिः",
    rom: "śuṭh (śuṭhaṁ) ālasye curādiḥ"
  },
  'SuT1_SuTaz_BvAxiH_gawiprawiGAwe': {
    dev: "शुठ् (शुठँ) गतिप्रतिघाते भ्वादिः",
    rom: "śuṭh (śuṭhaṁ) gatipratighāte bhvādiḥ"
  },
  'SuT2_SuTiz_BvAxiH_gawiprawiGAwe': {
    dev: "शुठ् (शुठिँ) गतिप्रतिघाते भ्वादिः",
    rom: "śuṭh (śuṭhiṁ) gatipratighāte bhvādiḥ"
  },
  'SuT4_SuTiz_curAxiH_SoRaNe': {
    dev: "शुठ् (शुठिँ) शोषणे चुरादिः",
    rom: "śuṭh (śuṭhiṁ) śoṣaṇe curādiḥ"
  },
  'SuT2_SuTiz_BvAxiH_SoRaNe': {
    dev: "शुठ् (शुठिँ) शोषणे भ्वादिः",
    rom: "śuṭh (śuṭhiṁ) śoṣaṇe bhvādiḥ"
  },
  'SuX1_SuXaz_xivAxiH_SOce': {
    dev: "शुध् (शुधँ) शौचे दिवादिः",
    rom: "śudh (śudhaṁ) śauce divādiḥ"
  },
  'Sun1_Sunaz_wuxAxiH_gawO': {
    dev: "शुन् (शुनँ) गतौ तुदादिः",
    rom: "śun (śunaṁ) gatau tudādiḥ"
  },
  'SunX1_SunXaz_BvAxiH_SuxXO': {
    dev: "शुन्ध् (शुन्धँ) शुद्धौ भ्वादिः",
    rom: "śundh (śundhaṁ) śuddhau bhvādiḥ"
  },
  'SunX2_SunXaz_curAxiH_SOcakarmaNi': {
    dev: "शुन्ध् (शुन्धँ) शौचकर्मणि चुरादिः",
    rom: "śundh (śundhaṁ) śaucakarmaṇi curādiḥ"
  },
  'SunB1_SunBaz_BvAxiH_BARaNe': {
    dev: "शुन्भ् (शुन्भँ) भाषणे भ्वादिः",
    rom: "śunbh (śunbhaṁ) bhāṣaṇe bhvādiḥ"
  },
  'SunB2_SunBaz_wuxAxiH_SoBArWe': {
    dev: "शुन्भ् (शुन्भँ) शोभार्थे तुदादिः",
    rom: "śunbh (śunbhaṁ) śobhārthe tudādiḥ"
  },
  'SunB1_SunBaz_BvAxiH_hiMsAyAm': {
    dev: "शुन्भ् (शुन्भँ) हिंसायाम् भ्वादिः",
    rom: "śunbh (śunbhaṁ) hiṃsāyām bhvādiḥ"
  },
  'SuB1_SuBaz_BvAxiH_xIpwO': {
    dev: "शुभ् (शुभँ) दीप्तौ भ्वादिः",
    rom: "śubh (śubhaṁ) dīptau bhvādiḥ"
  },
  'SuB1_SuBaz_BvAxiH_BARaNe': {
    dev: "शुभ् (शुभँ) भाषणे भ्वादिः",
    rom: "śubh (śubhaṁ) bhāṣaṇe bhvādiḥ"
  },
  'SuB2_SuBaz_wuxAxiH_SoBArWe': {
    dev: "शुभ् (शुभँ) शोभार्थे तुदादिः",
    rom: "śubh (śubhaṁ) śobhārthe tudādiḥ"
  },
  'SuB1_SuBaz_BvAxiH_hiMsAyAm': {
    dev: "शुभ् (शुभँ) हिंसायाम् भ्वादिः",
    rom: "śubh (śubhaṁ) hiṃsāyām bhvādiḥ"
  },
  'Sulk1_Sulkaz_curAxiH_sarjane': {
    dev: "शुल्क् (शुल्कँ) सर्जने चुरादिः",
    rom: "śulk (śulkaṁ) sarjane curādiḥ"
  },
  'Sulb1_Sulbaz_curAxiH_mAne': {
    dev: "शुल्ब् (शुल्बँ) माने चुरादिः",
    rom: "śulb (śulbaṁ) māne curādiḥ"
  },
  'SuR1_SuRaz_xivAxiH_SoRaNe': {
    dev: "शुष् (शुषँ) शोषणे दिवादिः",
    rom: "śuṣ (śuṣaṁ) śoṣaṇe divādiḥ"
  },
  'SUra1_SUra_curAxiH_vikrAnwO': {
    dev: "शूर (शूर) विक्रान्तौ चुरादिः",
    rom: "śūra (śūra) vikrāntau curādiḥ"
  },
  'SUr1_SUrIz_xivAxiH_swamBe': {
    dev: "शूर् (शूरीँ) स्तम्भे दिवादिः",
    rom: "śūr (śūrīṁ) stambhe divādiḥ"
  },
  'SUr1_SUrIz_xivAxiH_hiMsAyAm': {
    dev: "शूर् (शूरीँ) हिंसायाम् दिवादिः",
    rom: "śūr (śūrīṁ) hiṃsāyām divādiḥ"
  },
  'SUrp1_SUrpaz_curAxiH_mAne': {
    dev: "शूर्प् (शूर्पँ) माने चुरादिः",
    rom: "śūrp (śūrpaṁ) māne curādiḥ"
  },
  'SUl1_SUlaz_BvAxiH_rujAyAm': {
    dev: "शूल् (शूलँ) रुजायाम् भ्वादिः",
    rom: "śūl (śūlaṁ) rujāyām bhvādiḥ"
  },
  'SUl1_SUlaz_BvAxiH_safGAwe': {
    dev: "शूल् (शूलँ) सङ्घाते भ्वादिः",
    rom: "śūl (śūlaṁ) saṅghāte bhvādiḥ"
  },
  'SUR1_SURaz_BvAxiH_prasave': {
    dev: "शूष् (शूषँ) प्रसवे भ्वादिः",
    rom: "śūṣ (śūṣaṁ) prasave bhvādiḥ"
  },
  'SqX4_SqXaz_curAxiH_aprasahane': {
    dev: "शृध् (शृधँ) अप्रसहने चुरादिः",
    rom: "śṛdh (śṛdhaṁ) aprasahane curādiḥ"
  },
  'SqX2_SqXuz_BvAxiH_unxe': {
    dev: "शृध् (शृधुँ) उन्दे भ्वादिः",
    rom: "śṛdh (śṛdhuṁ) unde bhvādiḥ"
  },
  'SqX3_SqXuz_curAxiH_prasahane': {
    dev: "शृध् (शृधुँ) प्रसहने चुरादिः",
    rom: "śṛdh (śṛdhuṁ) prasahane curādiḥ"
  },
  'SqX2_SqXuz_BvAxiH_SabxakuwsAyAm': {
    dev: "शृध् (शृधुँ) शब्दकुत्सायाम् भ्वादिः",
    rom: "śṛdh (śṛdhuṁ) śabdakutsāyām bhvādiḥ"
  },
  'SqX1_SqXqz_BvAxiH_unxe': {
    dev: "शृध् (शृधृँ) उन्दे भ्वादिः",
    rom: "śṛdh (śṛdhṛṁ) unde bhvādiḥ"
  },
  'SQ1_SQ_kryAxiH_hiMsAyAm': {
    dev: "शॄ (शॄ) हिंसायाम् क्र्यादिः",
    rom: "śṝ (śṝ) hiṃsāyām kryādiḥ"
  },
  'SQ1_SQF_kryAxiH_hiMsAyAm': {
    dev: "शॄ (शॄञ्) हिंसायाम् क्र्यादिः",
    rom: "śṝ (śṝñ) hiṃsāyām kryādiḥ"
  },
  'Sel1_Selqz_BvAxiH_gawO': {
    dev: "शेल् (शेलृँ) गतौ भ्वादिः",
    rom: "śel (śelṛṁ) gatau bhvādiḥ"
  },
  'Sev1_Sevqz_BvAxiH_secane': {
    dev: "शेव् (शेवृँ) सेचने भ्वादिः",
    rom: "śev (śevṛṁ) secane bhvādiḥ"
  },
  'Sev1_Sevqz_BvAxiH_sevane': {
    dev: "शेव् (शेवृँ) सेवने भ्वादिः",
    rom: "śev (śevṛṁ) sevane bhvādiḥ"
  },
  'SE1_SE_BvAxiH_pAke': {
    dev: "शै (शै) पाके भ्वादिः",
    rom: "śai (śai) pāke bhvādiḥ"
  },
  'So1_So_xivAxiH_wanUkaraNe': {
    dev: "शो (शो) तनूकरणे दिवादिः",
    rom: "śo (śo) tanūkaraṇe divādiḥ"
  },
  'SoN1_SoNqz_BvAxiH_gawO': {
    dev: "शोण् (शोणृँ) गतौ भ्वादिः",
    rom: "śoṇ (śoṇṛṁ) gatau bhvādiḥ"
  },
  'SoN1_SoNqz_BvAxiH_varNe': {
    dev: "शोण् (शोणृँ) वर्णे भ्वादिः",
    rom: "śoṇ (śoṇṛṁ) varṇe bhvādiḥ"
  },
  'SOt1_SOtqz_BvAxiH_garve': {
    dev: "शौट् (शौटृँ) गर्वे भ्वादिः",
    rom: "śauṭ (śauṭṛṁ) garve bhvādiḥ"
  },
  'Scyuw1_Scyuwizr_BvAxiH_kRaraNe': {
    dev: "श्च्युत् (श्च्युतिँर्) क्षरणे भ्वादिः",
    rom: "ścyut (ścyutiṁr) kṣaraṇe bhvādiḥ"
  },
  'SmIl1_SmIlaz_BvAxiH_nimeRaNe': {
    dev: "श्मील् (श्मीलँ) निमेषणे भ्वादिः",
    rom: "śmīl (śmīlaṁ) nimeṣaṇe bhvādiḥ"
  },
  'SyE1_SyEf_BvAxiH_gawO': {
    dev: "श्यै (श्यैङ्) गतौ भ्वादिः",
    rom: "śyai (śyaiṅ) gatau bhvādiḥ"
  },
  'Srak1_Srakiz_BvAxiH_gawO': {
    dev: "श्रक् (श्रकिँ) गतौ भ्वादिः",
    rom: "śrak (śrakiṁ) gatau bhvādiḥ"
  },
  'Srag1_Sragiz_BvAxiH_gawO': {
    dev: "श्रग् (श्रगिँ) गतौ भ्वादिः",
    rom: "śrag (śragiṁ) gatau bhvādiḥ"
  },
  'SraN1_SraNaz_BvAxiH_gawO': {
    dev: "श्रण् (श्रणँ) गतौ भ्वादिः",
    rom: "śraṇ (śraṇaṁ) gatau bhvādiḥ"
  },
  'SraN2_SraNaz_curAxiH_xAne': {
    dev: "श्रण् (श्रणँ) दाने चुरादिः",
    rom: "śraṇ (śraṇaṁ) dāne curādiḥ"
  },
  'SraN1_SraNaz_BvAxiH_xAne': {
    dev: "श्रण् (श्रणँ) दाने भ्वादिः",
    rom: "śraṇ (śraṇaṁ) dāne bhvādiḥ"
  },
  'SraN3_SraNuz_curAxiH_xAne': {
    dev: "श्रण् (श्रणुँ) दाने चुरादिः",
    rom: "śraṇ (śraṇuṁ) dāne curādiḥ"
  },
  'SraWa1_SraWa_curAxiH_xOrbalye': {
    dev: "श्रथ (श्रथ) दौर्बल्ये चुरादिः",
    rom: "śratha (śratha) daurbalye curādiḥ"
  },
  'SraW3_SraWaz_curAxiH_prawiyawne': {
    dev: "श्रथ् (श्रथँ) प्रतियत्ने चुरादिः",
    rom: "śrath (śrathaṁ) pratiyatne curādiḥ"
  },
  'SraW3_SraWaz_curAxiH_prawiharRe': {
    dev: "श्रथ् (श्रथँ) प्रतिहर्षे चुरादिः",
    rom: "śrath (śrathaṁ) pratiharṣe curādiḥ"
  },
  'SraW3_SraWaz_curAxiH_prayawne': {
    dev: "श्रथ् (श्रथँ) प्रयत्ने चुरादिः",
    rom: "śrath (śrathaṁ) prayatne curādiḥ"
  },
  'SraW3_SraWaz_curAxiH_mokRaNe': {
    dev: "श्रथ् (श्रथँ) मोक्षणे चुरादिः",
    rom: "śrath (śrathaṁ) mokṣaṇe curādiḥ"
  },
  'SraW3_SraWaz_curAxiH_hiMsAyAm': {
    dev: "श्रथ् (श्रथँ) हिंसायाम् चुरादिः",
    rom: "śrath (śrathaṁ) hiṃsāyām curādiḥ"
  },
  'SraW2_SraWaz_BvAxiH_hiMsAyAm': {
    dev: "श्रथ् (श्रथँ) हिंसायाम् भ्वादिः",
    rom: "śrath (śrathaṁ) hiṃsāyām bhvādiḥ"
  },
  'SraW1_SraWiz_BvAxiH_SEWilye': {
    dev: "श्रथ् (श्रथिँ) शैथिल्ये भ्वादिः",
    rom: "śrath (śrathiṁ) śaithilye bhvādiḥ"
  },
  'SranW1_SranWaz_kryAxiH_prawiharRe': {
    dev: "श्रन्थ् (श्रन्थँ) प्रतिहर्षे क्र्यादिः",
    rom: "śranth (śranthaṁ) pratiharṣe kryādiḥ"
  },
  'SranW1_SranWaz_kryAxiH_mocane': {
    dev: "श्रन्थ् (श्रन्थँ) मोचने क्र्यादिः",
    rom: "śranth (śranthaṁ) mocane kryādiḥ"
  },
  'SranW1_SranWaz_kryAxiH_vimocane': {
    dev: "श्रन्थ् (श्रन्थँ) विमोचने क्र्यादिः",
    rom: "śranth (śranthaṁ) vimocane kryādiḥ"
  },
  'SranW1_SranWaz_kryAxiH_sanxarBe': {
    dev: "श्रन्थ् (श्रन्थँ) सन्दर्भे क्र्यादिः",
    rom: "śranth (śranthaṁ) sandarbhe kryādiḥ"
  },
  'SranW2_SranWaz_curAxiH_sanxarBe': {
    dev: "श्रन्थ् (श्रन्थँ) सन्दर्भे चुरादिः",
    rom: "śranth (śranthaṁ) sandarbhe curādiḥ"
  },
  'SranW1_SranWaz_kryAxiH_harRe': {
    dev: "श्रन्थ् (श्रन्थँ) हर्षे क्र्यादिः",
    rom: "śranth (śranthaṁ) harṣe kryādiḥ"
  },
  'SranB1_SranBuz_BvAxiH_pramAxe': {
    dev: "श्रन्भ् (श्रन्भुँ) प्रमादे भ्वादिः",
    rom: "śranbh (śranbhuṁ) pramāde bhvādiḥ"
  },
  'Sram1_Sramuz_xivAxiH_Kexe': {
    dev: "श्रम् (श्रमुँ) खेदे दिवादिः",
    rom: "śram (śramuṁ) khede divādiḥ"
  },
  'Sram1_Sramuz_xivAxiH_wapasi': {
    dev: "श्रम् (श्रमुँ) तपसि दिवादिः",
    rom: "śram (śramuṁ) tapasi divādiḥ"
  },
  'SrA2_SrA_axAxiH_pAke': {
    dev: "श्रा (श्रा) पाके अदादिः",
    rom: "śrā (śrā) pāke adādiḥ"
  },
  'SrA1_SrA_BvAxiH_pAke': {
    dev: "श्रा (श्रा) पाके भ्वादिः",
    rom: "śrā (śrā) pāke bhvādiḥ"
  },
  'Sri1_SriF_BvAxiH_sevAyAm': {
    dev: "श्रि (श्रिञ्) सेवायाम् भ्वादिः",
    rom: "śri (śriñ) sevāyām bhvādiḥ"
  },
  'SriR1_SriRuz_BvAxiH_xAhe': {
    dev: "श्रिष् (श्रिषुँ) दाहे भ्वादिः",
    rom: "śriṣ (śriṣuṁ) dāhe bhvādiḥ"
  },
  'SrI1_SrIF_kryAxiH_pAke': {
    dev: "श्री (श्रीञ्) पाके क्र्यादिः",
    rom: "śrī (śrīñ) pāke kryādiḥ"
  },
  'Sru1_Sru_BvAxiH_gawO': {
    dev: "श्रु (श्रु) गतौ भ्वादिः",
    rom: "śru (śru) gatau bhvādiḥ"
  },
  'Sru1_Sru_BvAxiH_SravaNe': {
    dev: "श्रु (श्रु) श्रवणे भ्वादिः",
    rom: "śru (śru) śravaṇe bhvādiḥ"
  },
  'Srek1_Srekqz_BvAxiH_gawO': {
    dev: "श्रेक् (श्रेकृँ) गतौ भ्वादिः",
    rom: "śrek (śrekṛṁ) gatau bhvādiḥ"
  },
  'SrE1_SrE_BvAxiH_pAke': {
    dev: "श्रै (श्रै) पाके भ्वादिः",
    rom: "śrai (śrai) pāke bhvādiḥ"
  },
  'SroN1_SroNqz_BvAxiH_gawiprawiGAwe': {
    dev: "श्रोण् (श्रोणृँ) गतिप्रतिघाते भ्वादिः",
    rom: "śroṇ (śroṇṛṁ) gatipratighāte bhvādiḥ"
  },
  'SroN1_SroNqz_BvAxiH_safGAwe': {
    dev: "श्रोण् (श्रोणृँ) सङ्घाते भ्वादिः",
    rom: "śroṇ (śroṇṛṁ) saṅghāte bhvādiḥ"
  },
  'Slak1_Slakiz_BvAxiH_gawO': {
    dev: "श्लक् (श्लकिँ) गतौ भ्वादिः",
    rom: "ślak (ślakiṁ) gatau bhvādiḥ"
  },
  'Slag1_Slagiz_BvAxiH_gawO': {
    dev: "श्लग् (श्लगिँ) गतौ भ्वादिः",
    rom: "ślag (ślagiṁ) gatau bhvādiḥ"
  },
  'SlaW1_SlaWaz_BvAxiH_hiMsAyAm': {
    dev: "श्लथ् (श्लथँ) हिंसायाम् भ्वादिः",
    rom: "ślath (ślathaṁ) hiṃsāyām bhvādiḥ"
  },
  'SlAK1_SlAKqz_BvAxiH_vyApwO': {
    dev: "श्लाख् (श्लाखृँ) व्याप्तौ भ्वादिः",
    rom: "ślākh (ślākhṛṁ) vyāptau bhvādiḥ"
  },
  'SlAG1_SlAGqz_BvAxiH_kawWane': {
    dev: "श्लाघ् (श्लाघृँ) कत्थने भ्वादिः",
    rom: "ślāgh (ślāghṛṁ) katthane bhvādiḥ"
  },
  'SliR3_SliRaz_curAxiH_Alifgane': {
    dev: "श्लिष् (श्लिषँ) आलिङ्गने चुरादिः",
    rom: "śliṣ (śliṣaṁ) āliṅgane curādiḥ"
  },
  'SliR2_SliRaz_xivAxiH_Alifgane': {
    dev: "श्लिष् (श्लिषँ) आलिङ्गने दिवादिः",
    rom: "śliṣ (śliṣaṁ) āliṅgane divādiḥ"
  },
  'SliR3_SliRaz_curAxiH_SleRaNe': {
    dev: "श्लिष् (श्लिषँ) श्लेषणे चुरादिः",
    rom: "śliṣ (śliṣaṁ) śleṣaṇe curādiḥ"
  },
  'SliR1_SliRuz_BvAxiH_xAhe': {
    dev: "श्लिष् (श्लिषुँ) दाहे भ्वादिः",
    rom: "śliṣ (śliṣuṁ) dāhe bhvādiḥ"
  },
  'SleR1_SleRqz_BvAxiH_gawO': {
    dev: "श्लेष् (श्लेषृँ) गतौ भ्वादिः",
    rom: "śleṣ (śleṣṛṁ) gatau bhvādiḥ"
  },
  'Slok1_Slokqz_BvAxiH_safGAwe': {
    dev: "श्लोक् (श्लोकृँ) सङ्घाते भ्वादिः",
    rom: "ślok (ślokṛṁ) saṅghāte bhvādiḥ"
  },
  'SloN1_SloNqz_BvAxiH_gawiprawiGAwe': {
    dev: "श्लोण् (श्लोणृँ) गतिप्रतिघाते भ्वादिः",
    rom: "śloṇ (śloṇṛṁ) gatipratighāte bhvādiḥ"
  },
  'SloN1_SloNqz_BvAxiH_safGAwe': {
    dev: "श्लोण् (श्लोणृँ) सङ्घाते भ्वादिः",
    rom: "śloṇ (śloṇṛṁ) saṅghāte bhvādiḥ"
  },
  'Svak1_Svakiz_BvAxiH_gawO': {
    dev: "श्वक् (श्वकिँ) गतौ भ्वादिः",
    rom: "śvak (śvakiṁ) gatau bhvādiḥ"
  },
  'Svag1_Svagiz_BvAxiH_gawO': {
    dev: "श्वग् (श्वगिँ) गतौ भ्वादिः",
    rom: "śvag (śvagiṁ) gatau bhvādiḥ"
  },
  'Svac1_Svacaz_BvAxiH_gawO': {
    dev: "श्वच् (श्वचँ) गतौ भ्वादिः",
    rom: "śvac (śvacaṁ) gatau bhvādiḥ"
  },
  'Svac2_Svaciz_BvAxiH_gawO': {
    dev: "श्वच् (श्वचिँ) गतौ भ्वादिः",
    rom: "śvac (śvaciṁ) gatau bhvādiḥ"
  },
  'SvaTa1_SvaTa_curAxiH_samyagABARaNe': {
    dev: "श्वठ (श्वठ) सम्यगाभाषणे चुरादिः",
    rom: "śvaṭha (śvaṭha) samyagābhāṣaṇe curādiḥ"
  },
  'SvaT1_SvaTaz_curAxiH_asaMskAre': {
    dev: "श्वठ् (श्वठँ) असंस्कारे चुरादिः",
    rom: "śvaṭh (śvaṭhaṁ) asaṃskāre curādiḥ"
  },
  'SvaT1_SvaTaz_curAxiH_gawO': {
    dev: "श्वठ् (श्वठँ) गतौ चुरादिः",
    rom: "śvaṭh (śvaṭhaṁ) gatau curādiḥ"
  },
  'SvaBr1_SvaBraz_curAxiH_gawyAm': {
    dev: "श्वभ्र् (श्वभ्रँ) गत्याम् चुरादिः",
    rom: "śvabhr (śvabhraṁ) gatyām curādiḥ"
  },
  'Svarw1_Svarwaz_curAxiH_gawyAm': {
    dev: "श्वर्त् (श्वर्तँ) गत्याम् चुरादिः",
    rom: "śvart (śvartaṁ) gatyām curādiḥ"
  },
  'Sval1_Svalaz_BvAxiH_ASugamane': {
    dev: "श्वल् (श्वलँ) आशुगमने भ्वादिः",
    rom: "śval (śvalaṁ) āśugamane bhvādiḥ"
  },
  'Svalk1_Svalkaz_curAxiH_pariBARaNe': {
    dev: "श्वल्क् (श्वल्कँ) परिभाषणे चुरादिः",
    rom: "śvalk (śvalkaṁ) paribhāṣaṇe curādiḥ"
  },
  'Svall1_Svallaz_BvAxiH_ASugamane': {
    dev: "श्वल्ल् (श्वल्लँ) आशुगमने भ्वादिः",
    rom: "śvall (śvallaṁ) āśugamane bhvādiḥ"
  },
  'Svas1_Svasaz_axAxiH_prANane': {
    dev: "श्वस् (श्वसँ) प्राणने अदादिः",
    rom: "śvas (śvasaṁ) prāṇane adādiḥ"
  },
  'Svi1_tuozSvi_BvAxiH_gawO': {
    dev: "श्वि (टुओँश्वि) गतौ भ्वादिः",
    rom: "śvi (ṭuoṁśvi) gatau bhvādiḥ"
  },
  'Svi1_tuozSvi_BvAxiH_vqxXO': {
    dev: "श्वि (टुओँश्वि) वृद्धौ भ्वादिः",
    rom: "śvi (ṭuoṁśvi) vṛddhau bhvādiḥ"
  },
  'Sviw1_SviwAz_BvAxiH_varNe': {
    dev: "श्वित् (श्विताँ) वर्णे भ्वादिः",
    rom: "śvit (śvitāṁ) varṇe bhvādiḥ"
  },
  'Svix1_Svixiz_BvAxiH_SvEwye': {
    dev: "श्विद् (श्विदिँ) श्वैत्ये भ्वादिः",
    rom: "śvid (śvidiṁ) śvaitye bhvādiḥ"
  },
  'Svel1_Svelqz_BvAxiH_calane': {
    dev: "श्वेल् (श्वेलृँ) चलने भ्वादिः",
    rom: "śvel (śvelṛṁ) calane bhvādiḥ"
  },
  'Rag1_Ragez_BvAxiH_saMvaraNe': {
    dev: "षग् (षगेँ) संवरणे भ्वादिः",
    rom: "ṣag (ṣageṁ) saṃvaraṇe bhvādiḥ"
  },
  'RaG1_RaGaz_svAxiH_hiMsAyAm': {
    dev: "षघ् (षघँ) हिंसायाम् स्वादिः",
    rom: "ṣagh (ṣaghaṁ) hiṃsāyām svādiḥ"
  },
  'Rac2_Racaz_BvAxiH_samavAye': {
    dev: "षच् (षचँ) समवाये भ्वादिः",
    rom: "ṣac (ṣacaṁ) samavāye bhvādiḥ"
  },
  'Rac1_Racaz_BvAxiH_secane': {
    dev: "षच् (षचँ) सेचने भ्वादिः",
    rom: "ṣac (ṣacaṁ) secane bhvādiḥ"
  },
  'Rat1_Rataz_BvAxiH_avayave': {
    dev: "षट् (षटँ) अवयवे भ्वादिः",
    rom: "ṣaṭ (ṣaṭaṁ) avayave bhvādiḥ"
  },
  'RaN1_RaNaz_BvAxiH_BakwO': {
    dev: "षण् (षणँ) भक्तौ भ्वादिः",
    rom: "ṣaṇ (ṣaṇaṁ) bhaktau bhvādiḥ"
  },
  'RaN1_RaNaz_BvAxiH_samBakwO': {
    dev: "षण् (षणँ) सम्भक्तौ भ्वादिः",
    rom: "ṣaṇ (ṣaṇaṁ) sambhaktau bhvādiḥ"
  },
  'RaN2_RaNuz_wanAxiH_xAne': {
    dev: "षण् (षणुँ) दाने तनादिः",
    rom: "ṣaṇ (ṣaṇuṁ) dāne tanādiḥ"
  },
  'Rawt1_Rawtaz_curAxiH_hiMsAyAm': {
    dev: "षत्ट् (षत्टँ) हिंसायाम् चुरादिः",
    rom: "ṣatṭ (ṣatṭaṁ) hiṃsāyām curādiḥ"
  },
  'Rax2_RaxLz_wuxAxiH_avasAxane': {
    dev: "षद् (षदॢँ) अवसादने तुदादिः",
    rom: "ṣad (ṣadḷṁ) avasādane tudādiḥ"
  },
  'Rax1_RaxLz_BvAxiH_avasAxane': {
    dev: "षद् (षदॢँ) अवसादने भ्वादिः",
    rom: "ṣad (ṣadḷṁ) avasādane bhvādiḥ"
  },
  'Rax2_RaxLz_wuxAxiH_gawO': {
    dev: "षद् (षदॢँ) गतौ तुदादिः",
    rom: "ṣad (ṣadḷṁ) gatau tudādiḥ"
  },
  'Rax1_RaxLz_BvAxiH_gawO': {
    dev: "षद् (षदॢँ) गतौ भ्वादिः",
    rom: "ṣad (ṣadḷṁ) gatau bhvādiḥ"
  },
  'Rax1_Raxaz_curAxiH_paxyarWe': {
    dev: "षद् (षदँ) पद्यर्थे चुरादिः",
    rom: "ṣad (ṣadaṁ) padyarthe curādiḥ"
  },
  'Rax2_RaxLz_wuxAxiH_viSaraNe': {
    dev: "षद् (षदॢँ) विशरणे तुदादिः",
    rom: "ṣad (ṣadḷṁ) viśaraṇe tudādiḥ"
  },
  'Rax1_RaxLz_BvAxiH_viSaraNe': {
    dev: "षद् (षदॢँ) विशरणे भ्वादिः",
    rom: "ṣad (ṣadḷṁ) viśaraṇe bhvādiḥ"
  },
  'Ranj1_Ranjaz_BvAxiH_safge': {
    dev: "षन्ज् (षन्जँ) सङ्गे भ्वादिः",
    rom: "ṣanj (ṣanjaṁ) saṅge bhvādiḥ"
  },
  'Ranb1_Ranbaz_curAxiH_sambanXe': {
    dev: "षन्ब् (षन्बँ) सम्बन्धे चुरादिः",
    rom: "ṣanb (ṣanbaṁ) sambandhe curādiḥ"
  },
  'Rap1_Rapaz_BvAxiH_samavAye': {
    dev: "षप् (षपँ) समवाये भ्वादिः",
    rom: "ṣap (ṣapaṁ) samavāye bhvādiḥ"
  },
  'Ram1_Ramaz_BvAxiH_avEklavye': {
    dev: "षम् (षमँ) अवैक्लव्ये भ्वादिः",
    rom: "ṣam (ṣamaṁ) avaiklavye bhvādiḥ"
  },
  'Ram1_Ramaz_BvAxiH_vEklavye': {
    dev: "षम् (षमँ) वैक्लव्ये भ्वादिः",
    rom: "ṣam (ṣamaṁ) vaiklavye bhvādiḥ"
  },
  'Rarj1_Rarjaz_BvAxiH_arjane': {
    dev: "षर्ज् (षर्जँ) अर्जने भ्वादिः",
    rom: "ṣarj (ṣarjaṁ) arjane bhvādiḥ"
  },
  'Rarb1_Rarbaz_BvAxiH_gawO': {
    dev: "षर्ब् (षर्बँ) गतौ भ्वादिः",
    rom: "ṣarb (ṣarbaṁ) gatau bhvādiḥ"
  },
  'Rarv1_Rarvaz_BvAxiH_hiMsAyAm': {
    dev: "षर्व् (षर्वँ) हिंसायाम् भ्वादिः",
    rom: "ṣarv (ṣarvaṁ) hiṃsāyām bhvādiḥ"
  },
  'Ral1_Ralaz_BvAxiH_gawO': {
    dev: "षल् (षलँ) गतौ भ्वादिः",
    rom: "ṣal (ṣalaṁ) gatau bhvādiḥ"
  },
  'Ras1_Rasaz_axAxiH_svapne': {
    dev: "षस् (षसँ) स्वप्ने अदादिः",
    rom: "ṣas (ṣasaṁ) svapne adādiḥ"
  },
  'Rasj1_Rasjaz_BvAxiH_gawO': {
    dev: "षस्ज् (षस्जँ) गतौ भ्वादिः",
    rom: "ṣasj (ṣasjaṁ) gatau bhvādiḥ"
  },
  'Rasw1_Raswiz_axAxiH_svapne': {
    dev: "षस्त् (षस्तिँ) स्वप्ने अदादिः",
    rom: "ṣast (ṣastiṁ) svapne adādiḥ"
  },
  'Rah3_Rahaz_curAxiH_marRaNe': {
    dev: "षह् (षहँ) मर्षणे चुरादिः",
    rom: "ṣah (ṣahaṁ) marṣaṇe curādiḥ"
  },
  'Rah1_Rahaz_BvAxiH_marRaNe': {
    dev: "षह् (षहँ) मर्षणे भ्वादिः",
    rom: "ṣah (ṣahaṁ) marṣaṇe bhvādiḥ"
  },
  'Rah2_Rahaz_xivAxiH_SakyarWe': {
    dev: "षह् (षहँ) शक्यर्थे दिवादिः",
    rom: "ṣah (ṣahaṁ) śakyarthe divādiḥ"
  },
  'RAX1_RAXaz_svAxiH_saMsixXO': {
    dev: "षाध् (षाधँ) संसिद्धौ स्वादिः",
    rom: "ṣādh (ṣādhaṁ) saṃsiddhau svādiḥ"
  },
  'RAnwv1_RAnwvaz_curAxiH_sAmaprayoge': {
    dev: "षान्त्व् (षान्त्वँ) सामप्रयोगे चुरादिः",
    rom: "ṣāntv (ṣāntvaṁ) sāmaprayoge curādiḥ"
  },
  'Ri2_RiF_kryAxiH_banXane': {
    dev: "षि (षिञ्) बन्धने क्र्यादिः",
    rom: "ṣi (ṣiñ) bandhane kryādiḥ"
  },
  'Ri1_RiF_svAxiH_banXane': {
    dev: "षि (षिञ्) बन्धने स्वादिः",
    rom: "ṣi (ṣiñ) bandhane svādiḥ"
  },
  'Ric1_Ricaz_wuxAxiH_kRaraNe': {
    dev: "षिच् (षिचँ) क्षरणे तुदादिः",
    rom: "ṣic (ṣicaṁ) kṣaraṇe tudādiḥ"
  },
  'Rit1_Ritaz_BvAxiH_anAxare': {
    dev: "षिट् (षिटँ) अनादरे भ्वादिः",
    rom: "ṣiṭ (ṣiṭaṁ) anādare bhvādiḥ"
  },
  'RiX2_RiXuz_BvAxiH_gawyAm': {
    dev: "षिध् (षिधुँ) गत्याम् भ्वादिः",
    rom: "ṣidh (ṣidhuṁ) gatyām bhvādiḥ"
  },
  'RiX3_RiXuz_xivAxiH_saMrAxXO': {
    dev: "षिध् (षिधुँ) संराद्धौ दिवादिः",
    rom: "ṣidh (ṣidhuṁ) saṃrāddhau divādiḥ"
  },
  'RiX1_RiXUz_BvAxiH_mAfgalye': {
    dev: "षिध् (षिधूँ) माङ्गल्ये भ्वादिः",
    rom: "ṣidh (ṣidhūṁ) māṅgalye bhvādiḥ"
  },
  'RiX1_RiXUz_BvAxiH_SAswre': {
    dev: "षिध् (षिधूँ) शास्त्रे भ्वादिः",
    rom: "ṣidh (ṣidhūṁ) śāstre bhvādiḥ"
  },
  'Ril1_Rilaz_wuxAxiH_uFCe': {
    dev: "षिल् (षिलँ) उञ्छे तुदादिः",
    rom: "ṣil (ṣilaṁ) uñche tudādiḥ"
  },
  'Riv1_Rivuz_xivAxiH_wanwusanwAne': {
    dev: "षिव् (षिवुँ) तन्तुसन्ताने दिवादिः",
    rom: "ṣiv (ṣivuṁ) tantusantāne divādiḥ"
  },
  'Ru2_Ru_axAxiH_ESvarye': {
    dev: "षु (षु) ऐश्वर्ये अदादिः",
    rom: "ṣu (ṣu) aiśvarye adādiḥ"
  },
  'Ru1_Ru_BvAxiH_ESvarye': {
    dev: "षु (षु) ऐश्वर्ये भ्वादिः",
    rom: "ṣu (ṣu) aiśvarye bhvādiḥ"
  },
  'Ru1_Ru_BvAxiH_gawO': {
    dev: "षु (षु) गतौ भ्वादिः",
    rom: "ṣu (ṣu) gatau bhvādiḥ"
  },
  'Ru2_Ru_axAxiH_prasave': {
    dev: "षु (षु) प्रसवे अदादिः",
    rom: "ṣu (ṣu) prasave adādiḥ"
  },
  'Ru1_Ru_BvAxiH_prasave': {
    dev: "षु (षु) प्रसवे भ्वादिः",
    rom: "ṣu (ṣu) prasave bhvādiḥ"
  },
  'Ru3_RuF_svAxiH_aBiRave': {
    dev: "षु (षुञ्) अभिषवे स्वादिः",
    rom: "ṣu (ṣuñ) abhiṣave svādiḥ"
  },
  'Ruwt1_Ruwtaz_curAxiH_anAxare': {
    dev: "षुत्ट् (षुत्टँ) अनादरे चुरादिः",
    rom: "ṣutṭ (ṣutṭaṁ) anādare curādiḥ"
  },
  'Rur1_Ruraz_wuxAxiH_ESvarye': {
    dev: "षुर् (षुरँ) ऐश्वर्ये तुदादिः",
    rom: "ṣur (ṣuraṁ) aiśvarye tudādiḥ"
  },
  'Rur1_Ruraz_wuxAxiH_xIpwO': {
    dev: "षुर् (षुरँ) दीप्तौ तुदादिः",
    rom: "ṣur (ṣuraṁ) dīptau tudādiḥ"
  },
  'Ruh1_Ruhaz_xivAxiH_cakyarWe': {
    dev: "षुह् (षुहँ) चक्यर्थे दिवादिः",
    rom: "ṣuh (ṣuhaṁ) cakyarthe divādiḥ"
  },
  'Ruh1_Ruhaz_xivAxiH_SakyarWe': {
    dev: "षुह् (षुहँ) शक्यर्थे दिवादिः",
    rom: "ṣuh (ṣuhaṁ) śakyarthe divādiḥ"
  },
  'RU3_RU_wuxAxiH_preraNe': {
    dev: "षू (षू) प्रेरणे तुदादिः",
    rom: "ṣū (ṣū) preraṇe tudādiḥ"
  },
  'RU1_RUf_axAxiH_prANigarBavimocane': {
    dev: "षू (षूङ्) प्राणिगर्भविमोचने अदादिः",
    rom: "ṣū (ṣūṅ) prāṇigarbhavimocane adādiḥ"
  },
  'RU2_RUf_xivAxiH_prANiprasave': {
    dev: "षू (षूङ्) प्राणिप्रसवे दिवादिः",
    rom: "ṣū (ṣūṅ) prāṇiprasave divādiḥ"
  },
  'RUx2_RUxaz_curAxiH_AsravaNe': {
    dev: "षूद् (षूदँ) आस्रवणे चुरादिः",
    rom: "ṣūd (ṣūdaṁ) āsravaṇe curādiḥ"
  },
  'RUx2_RUxaz_curAxiH_kRaraNe': {
    dev: "षूद् (षूदँ) क्षरणे चुरादिः",
    rom: "ṣūd (ṣūdaṁ) kṣaraṇe curādiḥ"
  },
  'RUx1_RUxaz_BvAxiH_kRaraNe': {
    dev: "षूद् (षूदँ) क्षरणे भ्वादिः",
    rom: "ṣūd (ṣūdaṁ) kṣaraṇe bhvādiḥ"
  },
  'RUrkR1_RUrkRaz_BvAxiH_anAxare': {
    dev: "षूर्क्ष् (षूर्क्षँ) अनादरे भ्वादिः",
    rom: "ṣūrkṣ (ṣūrkṣaṁ) anādare bhvādiḥ"
  },
  'RUrkRy1_RUrkRyaz_BvAxiH_IrRyAyAm': {
    dev: "षूर्क्ष्य् (षूर्क्ष्यँ) ईर्ष्यायाम् भ्वादिः",
    rom: "ṣūrkṣy (ṣūrkṣyaṁ) īrṣyāyām bhvādiḥ"
  },
  'RUR1_RURaz_BvAxiH_prasave': {
    dev: "षूष् (षूषँ) प्रसवे भ्वादिः",
    rom: "ṣūṣ (ṣūṣaṁ) prasave bhvādiḥ"
  },
  'RqX1_RqXqz_BvAxiH_unxe': {
    dev: "षृध् (षृधृँ) उन्दे भ्वादिः",
    rom: "ṣṛdh (ṣṛdhṛṁ) unde bhvādiḥ"
  },
  'RqnB1_RqnBuz_BvAxiH_hiMsAyAm': {
    dev: "षृन्भ् (षृन्भुँ) हिंसायाम् भ्वादिः",
    rom: "ṣṛnbh (ṣṛnbhuṁ) hiṃsāyām bhvādiḥ"
  },
  'RqB1_RqBuz_BvAxiH_hiMsAyAm': {
    dev: "षृभ् (षृभुँ) हिंसायाम् भ्वादिः",
    rom: "ṣṛbh (ṣṛbhuṁ) hiṃsāyām bhvādiḥ"
  },
  'Reb1_Rebqz_BvAxiH_sevane': {
    dev: "षेब् (षेबृँ) सेवने भ्वादिः",
    rom: "ṣeb (ṣebṛṁ) sevane bhvādiḥ"
  },
  'Rev1_Revqz_BvAxiH_secane': {
    dev: "षेव् (षेवृँ) सेचने भ्वादिः",
    rom: "ṣev (ṣevṛṁ) secane bhvādiḥ"
  },
  'Rev1_Revqz_BvAxiH_sevane': {
    dev: "षेव् (षेवृँ) सेवने भ्वादिः",
    rom: "ṣev (ṣevṛṁ) sevane bhvādiḥ"
  },
  'RE1_RE_BvAxiH_kRaye': {
    dev: "षै (षै) क्षये भ्वादिः",
    rom: "ṣai (ṣai) kṣaye bhvādiḥ"
  },
  'Ro1_Ro_xivAxiH_anwakarmaNi': {
    dev: "षो (षो) अन्तकर्मणि दिवादिः",
    rom: "ṣo (ṣo) antakarmaṇi divādiḥ"
  },
  'RkaB1_RkaBiz_BvAxiH_prawibanXe': {
    dev: "ष्कभ् (ष्कभिँ) प्रतिबन्धे भ्वादिः",
    rom: "ṣkabh (ṣkabhiṁ) pratibandhe bhvādiḥ"
  },
  'RtIm1_RtImaz_xivAxiH_ArxrIBAve': {
    dev: "ष्टीम् (ष्टीमँ) आर्द्रीभावे दिवादिः",
    rom: "ṣṭīm (ṣṭīmaṁ) ārdrībhāve divādiḥ"
  },
  'Rtuc1_Rtucaz_BvAxiH_prasAxe': {
    dev: "ष्टुच् (ष्टुचँ) प्रसादे भ्वादिः",
    rom: "ṣṭuc (ṣṭucaṁ) prasāde bhvādiḥ"
  },
  'RtuB1_RtuBuz_BvAxiH_swamBe': {
    dev: "ष्टुभ् (ष्टुभुँ) स्तम्भे भ्वादिः",
    rom: "ṣṭubh (ṣṭubhuṁ) stambhe bhvādiḥ"
  },
  'RtqkR1_RtqkRaz_BvAxiH_gawO': {
    dev: "ष्टृक्ष् (ष्टृक्षँ) गतौ भ्वादिः",
    rom: "ṣṭṛkṣ (ṣṭṛkṣaṁ) gatau bhvādiḥ"
  },
  'RtyE1_RtyE_BvAxiH_Sabxe': {
    dev: "ष्ट्यै (ष्ट्यै) शब्दे भ्वादिः",
    rom: "ṣṭyai (ṣṭyai) śabde bhvādiḥ"
  },
  'RtyE1_RtyE_BvAxiH_safGAwe': {
    dev: "ष्ट्यै (ष्ट्यै) सङ्घाते भ्वादिः",
    rom: "ṣṭyai (ṣṭyai) saṅghāte bhvādiḥ"
  },
  'RTiv2_RTivuz_xivAxiH_nirasane': {
    dev: "ष्ठिव् (ष्ठिवुँ) निरसने दिवादिः",
    rom: "ṣṭhiv (ṣṭhivuṁ) nirasane divādiḥ"
  },
  'RTiv1_RTivuz_BvAxiH_nirasane': {
    dev: "ष्ठिव् (ष्ठिवुँ) निरसने भ्वादिः",
    rom: "ṣṭhiv (ṣṭhivuṁ) nirasane bhvādiḥ"
  },
  'RNE1_RNE_BvAxiH_veRtane': {
    dev: "ष्णै (ष्णै) वेष्टने भ्वादिः",
    rom: "ṣṇai (ṣṇai) veṣṭane bhvādiḥ"
  },
  'Rwak1_Rwakaz_BvAxiH_prawiGAwe': {
    dev: "ष्तक् (ष्तकँ) प्रतिघाते भ्वादिः",
    rom: "ṣtak (ṣtakaṁ) pratighāte bhvādiḥ"
  },
  'Rwan1_Rwanaz_BvAxiH_Sabxe': {
    dev: "ष्तन् (ष्तनँ) शब्दे भ्वादिः",
    rom: "ṣtan (ṣtanaṁ) śabde bhvādiḥ"
  },
  'RwaB1_RwaBiz_BvAxiH_prawibanXe': {
    dev: "ष्तभ् (ष्तभिँ) प्रतिबन्धे भ्वादिः",
    rom: "ṣtabh (ṣtabhiṁ) pratibandhe bhvādiḥ"
  },
  'Rwam1_Rwamaz_BvAxiH_avEklavye': {
    dev: "ष्तम् (ष्तमँ) अवैक्लव्ये भ्वादिः",
    rom: "ṣtam (ṣtamaṁ) avaiklavye bhvādiḥ"
  },
  'Rwam1_Rwamaz_BvAxiH_vEklavye': {
    dev: "ष्तम् (ष्तमँ) वैक्लव्ये भ्वादिः",
    rom: "ṣtam (ṣtamaṁ) vaiklavye bhvādiḥ"
  },
  'RwiG1_RwiGaz_svAxiH_Askanxane': {
    dev: "ष्तिघ् (ष्तिघँ) आस्कन्दने स्वादिः",
    rom: "ṣtigh (ṣtighaṁ) āskandane svādiḥ"
  },
  'Rwip1_Rwipqz_BvAxiH_kRaraNe': {
    dev: "ष्तिप् (ष्तिपृँ) क्षरणे भ्वादिः",
    rom: "ṣtip (ṣtipṛṁ) kṣaraṇe bhvādiḥ"
  },
  'Rwim1_Rwimaz_xivAxiH_ArxrIBAve': {
    dev: "ष्तिम् (ष्तिमँ) आर्द्रीभावे दिवादिः",
    rom: "ṣtim (ṣtimaṁ) ārdrībhāve divādiḥ"
  },
  'RwIm1_RwImaz_xivAxiH_ArxrIBAve': {
    dev: "ष्तीम् (ष्तीमँ) आर्द्रीभावे दिवादिः",
    rom: "ṣtīm (ṣtīmaṁ) ārdrībhāve divādiḥ"
  },
  'Rwu1_RwuF_axAxiH_swuwO': {
    dev: "ष्तु (ष्तुञ्) स्तुतौ अदादिः",
    rom: "ṣtu (ṣtuñ) stutau adādiḥ"
  },
  'Rwuc1_Rwucaz_BvAxiH_prasAxe': {
    dev: "ष्तुच् (ष्तुचँ) प्रसादे भ्वादिः",
    rom: "ṣtuc (ṣtucaṁ) prasāde bhvādiḥ"
  },
  'RwuB1_RwuBuz_BvAxiH_swamBe': {
    dev: "ष्तुभ् (ष्तुभुँ) स्तम्भे भ्वादिः",
    rom: "ṣtubh (ṣtubhuṁ) stambhe bhvādiḥ"
  },
  'RwUp1_RwUpaz_curAxiH_samucCrAye': {
    dev: "ष्तूप् (ष्तूपँ) समुच्छ्राये चुरादिः",
    rom: "ṣtūp (ṣtūpaṁ) samucchrāye curādiḥ"
  },
  'Rwep1_Rwepqz_BvAxiH_kRaraNe': {
    dev: "ष्तेप् (ष्तेपृँ) क्षरणे भ्वादिः",
    rom: "ṣtep (ṣtepṛṁ) kṣaraṇe bhvādiḥ"
  },
  'RwE1_RwE_BvAxiH_veRtane': {
    dev: "ष्तै (ष्तै) वेष्टने भ्वादिः",
    rom: "ṣtai (ṣtai) veṣṭane bhvādiḥ"
  },
  'RWag1_RWagez_BvAxiH_saMvaraNe': {
    dev: "ष्थग् (ष्थगेँ) संवरणे भ्वादिः",
    rom: "ṣthag (ṣthageṁ) saṃvaraṇe bhvādiḥ"
  },
  'RWal1_RWalaz_BvAxiH_sWAne': {
    dev: "ष्थल् (ष्थलँ) स्थाने भ्वादिः",
    rom: "ṣthal (ṣthalaṁ) sthāne bhvādiḥ"
  },
  'RWA1_RWA_BvAxiH_gawinivqwwO': {
    dev: "ष्था (ष्था) गतिनिवृत्तौ भ्वादिः",
    rom: "ṣthā (ṣthā) gatinivṛttau bhvādiḥ"
  },
  'RWud1_RWudaz_wuxAxiH_saMvaraNe': {
    dev: "ष्थुड् (ष्थुडँ) संवरणे तुदादिः",
    rom: "ṣthuḍ (ṣthuḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'Rnas1_Rnasuz_xivAxiH_nirasane': {
    dev: "ष्नस् (ष्नसुँ) निरसने दिवादिः",
    rom: "ṣnas (ṣnasuṁ) nirasane divādiḥ"
  },
  'RnA1_RnA_axAxiH_SOce': {
    dev: "ष्ना (ष्ना) शौचे अदादिः",
    rom: "ṣnā (ṣnā) śauce adādiḥ"
  },
  'Rnih1_Rnihaz_xivAxiH_prIwO': {
    dev: "ष्निह् (ष्निहँ) प्रीतौ दिवादिः",
    rom: "ṣnih (ṣnihaṁ) prītau divādiḥ"
  },
  'Rnih2_Rnihaz_curAxiH_snehane': {
    dev: "ष्निह् (ष्निहँ) स्नेहने चुरादिः",
    rom: "ṣnih (ṣnihaṁ) snehane curādiḥ"
  },
  'Rnu1_Rnu_axAxiH_prasravaNe': {
    dev: "ष्नु (ष्नु) प्रस्रवणे अदादिः",
    rom: "ṣnu (ṣnu) prasravaṇe adādiḥ"
  },
  'Rnusa1_Rnusa_xivAxiH_nirasane': {
    dev: "ष्नुस (ष्नुस) निरसने दिवादिः",
    rom: "ṣnusa (ṣnusa) nirasane divādiḥ"
  },
  'Rnus1_Rnusuz_xivAxiH_axane': {
    dev: "ष्नुस् (ष्नुसुँ) अदने दिवादिः",
    rom: "ṣnus (ṣnusuṁ) adane divādiḥ"
  },
  'Rnuh1_Rnuhaz_xivAxiH_uxgiraNe': {
    dev: "ष्नुह् (ष्नुहँ) उद्गिरणे दिवादिः",
    rom: "ṣnuh (ṣnuhaṁ) udgiraṇe divādiḥ"
  },
  'RnE1_RnE_BvAxiH_veRtane': {
    dev: "ष्नै (ष्नै) वेष्टने भ्वादिः",
    rom: "ṣnai (ṣnai) veṣṭane bhvādiḥ"
  },
  'Rmi1_Rmif_BvAxiH_IRaxXasane': {
    dev: "ष्मि (ष्मिङ्) ईषद्धसने भ्वादिः",
    rom: "ṣmi (ṣmiṅ) īṣaddhasane bhvādiḥ"
  },
  'Rvakk1_Rvakkaz_BvAxiH_gawO': {
    dev: "ष्वक्क् (ष्वक्कँ) गतौ भ्वादिः",
    rom: "ṣvakk (ṣvakkaṁ) gatau bhvādiḥ"
  },
  'Rvakv1_Rvakvaz_BvAxiH_gawO': {
    dev: "ष्वक्व् (ष्वक्वँ) गतौ भ्वादिः",
    rom: "ṣvakv (ṣvakvaṁ) gatau bhvādiḥ"
  },
  'Rvax2_Rvaxaz_curAxiH_AsvAxane': {
    dev: "ष्वद् (ष्वदँ) आस्वादने चुरादिः",
    rom: "ṣvad (ṣvadaṁ) āsvādane curādiḥ"
  },
  'Rvax1_Rvaxaz_BvAxiH_AsvAxane': {
    dev: "ष्वद् (ष्वदँ) आस्वादने भ्वादिः",
    rom: "ṣvad (ṣvadaṁ) āsvādane bhvādiḥ"
  },
  'Rvax2_Rvaxaz_curAxiH_saMvaraNe': {
    dev: "ष्वद् (ष्वदँ) संवरणे चुरादिः",
    rom: "ṣvad (ṣvadaṁ) saṃvaraṇe curādiḥ"
  },
  'Rvanj1_Rvanjaz_BvAxiH_pariRvafge': {
    dev: "ष्वन्ज् (ष्वन्जँ) परिष्वङ्गे भ्वादिः",
    rom: "ṣvanj (ṣvanjaṁ) pariṣvaṅge bhvādiḥ"
  },
  'Rvap1_FiRvapaz_axAxiH_Saye': {
    dev: "ष्वप् (ञिष्वपँ) शये अदादिः",
    rom: "ṣvap (ñiṣvapaṁ) śaye adādiḥ"
  },
  'RvaRk1_RvaRkaz_BvAxiH_gawO': {
    dev: "ष्वष्क् (ष्वष्कँ) गतौ भ्वादिः",
    rom: "ṣvaṣk (ṣvaṣkaṁ) gatau bhvādiḥ"
  },
  'RvixA1_RvixA_xivAxiH_gAwraprakRaraNe': {
    dev: "ष्विदा (ष्विदा) गात्रप्रक्षरणे दिवादिः",
    rom: "ṣvidā (ṣvidā) gātraprakṣaraṇe divādiḥ"
  },
  'Rvix2_FiRvixAz_xivAxiH_gAwraprakRaraNe': {
    dev: "ष्विद् (ञिष्विदाँ) गात्रप्रक्षरणे दिवादिः",
    rom: "ṣvid (ñiṣvidāṁ) gātraprakṣaraṇe divādiḥ"
  },
  'Rvix1_FiRvixAz_BvAxiH_gAwraprasravaNe': {
    dev: "ष्विद् (ञिष्विदाँ) गात्रप्रस्रवणे भ्वादिः",
    rom: "ṣvid (ñiṣvidāṁ) gātraprasravaṇe bhvādiḥ"
  },
  'Rvix1_FiRvixAz_BvAxiH_mocane': {
    dev: "ष्विद् (ञिष्विदाँ) मोचने भ्वादिः",
    rom: "ṣvid (ñiṣvidāṁ) mocane bhvādiḥ"
  },
  'Rvix1_FiRvixAz_BvAxiH_snehane': {
    dev: "ष्विद् (ञिष्विदाँ) स्नेहने भ्वादिः",
    rom: "ṣvid (ñiṣvidāṁ) snehane bhvādiḥ"
  },
  'saMgrAm1_saMgrAmaz_curAxiH_yuxXe': {
    dev: "संग्राम् (संग्रामँ) युद्धे चुरादिः",
    rom: "saṃgrām (saṃgrāmaṁ) yuddhe curādiḥ"
  },
  'safkewa1_safkewa_curAxiH_AmanwraNe': {
    dev: "सङ्केत (सङ्केत) आमन्त्रणे चुरादिः",
    rom: "saṅketa (saṅketa) āmantraṇe curādiḥ"
  },
  'sawra1_sawra_curAxiH_sanwAnakriyAyAm': {
    dev: "सत्र (सत्र) सन्तानक्रियायाम् चुरादिः",
    rom: "satra (satra) santānakriyāyām curādiḥ"
  },
  'saBAja1_saBAja_curAxiH_xarSane': {
    dev: "सभाज (सभाज) दर्शने चुरादिः",
    rom: "sabhāja (sabhāja) darśane curādiḥ"
  },
  'saBAja1_saBAja_curAxiH_prIwO': {
    dev: "सभाज (सभाज) प्रीतौ चुरादिः",
    rom: "sabhāja (sabhāja) prītau curādiḥ"
  },
  'sarj1_sarjaz_BvAxiH_arjane': {
    dev: "सर्ज् (सर्जँ) अर्जने भ्वादिः",
    rom: "sarj (sarjaṁ) arjane bhvādiḥ"
  },
  'sarb1_sarbaz_BvAxiH_gawO': {
    dev: "सर्ब् (सर्बँ) गतौ भ्वादिः",
    rom: "sarb (sarbaṁ) gatau bhvādiḥ"
  },
  'sal1_salaz_BvAxiH_gawO': {
    dev: "सल् (सलँ) गतौ भ्वादिः",
    rom: "sal (salaṁ) gatau bhvādiḥ"
  },
  'sAX1_sAXaz_svAxiH_saMsixXO': {
    dev: "साध् (साधँ) संसिद्धौ स्वादिः",
    rom: "sādh (sādhaṁ) saṃsiddhau svādiḥ"
  },
  'sAnwv1_sAnwvaz_curAxiH_sAmaprayoge': {
    dev: "सान्त्व् (सान्त्वँ) सामप्रयोगे चुरादिः",
    rom: "sāntv (sāntvaṁ) sāmaprayoge curādiḥ"
  },
  'sAnb1_sAnbaz_curAxiH_sambanXe': {
    dev: "सान्ब् (सान्बँ) सम्बन्धे चुरादिः",
    rom: "sānb (sānbaṁ) sambandhe curādiḥ"
  },
  'sAma1_sAma_curAxiH_sAnwvaprayoge': {
    dev: "साम (साम) सान्त्वप्रयोगे चुरादिः",
    rom: "sāma (sāma) sāntvaprayoge curādiḥ"
  },
  'sAra1_sAra_curAxiH_xOrbalye': {
    dev: "सार (सार) दौर्बल्ये चुरादिः",
    rom: "sāra (sāra) daurbalye curādiḥ"
  },
  'suKa1_suKa_curAxiH_wawkriyAyAm': {
    dev: "सुख (सुख) तत्क्रियायाम् चुरादिः",
    rom: "sukha (sukha) tatkriyāyām curādiḥ"
  },
  'sUca1_sUca_curAxiH_pESunye': {
    dev: "सूच (सूच) पैशुन्ये चुरादिः",
    rom: "sūca (sūca) paiśunye curādiḥ"
  },
  'sUwra1_sUwra_curAxiH_vimocane': {
    dev: "सूत्र (सूत्र) विमोचने चुरादिः",
    rom: "sūtra (sūtra) vimocane curādiḥ"
  },
  'sUwra1_sUwra_curAxiH_veRtane': {
    dev: "सूत्र (सूत्र) वेष्टने चुरादिः",
    rom: "sūtra (sūtra) veṣṭane curādiḥ"
  },
  'sUrkR1_sUrkRaz_BvAxiH_Axare': {
    dev: "सूर्क्ष् (सूर्क्षँ) आदरे भ्वादिः",
    rom: "sūrkṣ (sūrkṣaṁ) ādare bhvādiḥ"
  },
  'sUrkRy1_sUrkRyaz_BvAxiH_anAxare': {
    dev: "सूर्क्ष्य् (सूर्क्ष्यँ) अनादरे भ्वादिः",
    rom: "sūrkṣy (sūrkṣyaṁ) anādare bhvādiḥ"
  },
  'sUrkRy1_sUrkRyaz_BvAxiH_IrRyAyAm': {
    dev: "सूर्क्ष्य् (सूर्क्ष्यँ) ईर्ष्यायाम् भ्वादिः",
    rom: "sūrkṣy (sūrkṣyaṁ) īrṣyāyām bhvādiḥ"
  },
  'sq2_sq_juhowyAxiH_gawO': {
    dev: "सृ (सृ) गतौ जुहोत्यादिः",
    rom: "sṛ (sṛ) gatau juhotyādiḥ"
  },
  'sq1_sq_BvAxiH_gawO': {
    dev: "सृ (सृ) गतौ भ्वादिः",
    rom: "sṛ (sṛ) gatau bhvādiḥ"
  },
  'sqj2_sqjaz_wuxAxiH_visarge': {
    dev: "सृज् (सृजँ) विसर्गे तुदादिः",
    rom: "sṛj (sṛjaṁ) visarge tudādiḥ"
  },
  'sqj1_sqjaz_xivAxiH_visarge': {
    dev: "सृज् (सृजँ) विसर्गे दिवादिः",
    rom: "sṛj (sṛjaṁ) visarge divādiḥ"
  },
  'sqnB1_sqnBuz_BvAxiH_hiMsAyAm': {
    dev: "सृन्भ् (सृन्भुँ) हिंसायाम् भ्वादिः",
    rom: "sṛnbh (sṛnbhuṁ) hiṃsāyām bhvādiḥ"
  },
  'sqp1_sqpLz_BvAxiH_gawO': {
    dev: "सृप् (सृपॢँ) गतौ भ्वादिः",
    rom: "sṛp (sṛpḷṁ) gatau bhvādiḥ"
  },
  'sqB1_sqBuz_BvAxiH_hiMsAyAm': {
    dev: "सृभ् (सृभुँ) हिंसायाम् भ्वादिः",
    rom: "sṛbh (sṛbhuṁ) hiṃsāyām bhvādiḥ"
  },
  'sek1_sekqz_BvAxiH_gawO': {
    dev: "सेक् (सेकृँ) गतौ भ्वादिः",
    rom: "sek (sekṛṁ) gatau bhvādiḥ"
  },
  'sev1_sevqz_BvAxiH_sevane': {
    dev: "सेव् (सेवृँ) सेवने भ्वादिः",
    rom: "sev (sevṛṁ) sevane bhvādiḥ"
  },
  'sE1_sE_BvAxiH_kRaye': {
    dev: "सै (सै) क्षये भ्वादिः",
    rom: "sai (sai) kṣaye bhvādiḥ"
  },
  'skanx1_skanxizr_BvAxiH_gawO': {
    dev: "स्कन्द् (स्कन्दिँर्) गतौ भ्वादिः",
    rom: "skand (skandiṁr) gatau bhvādiḥ"
  },
  'skanx1_skanxizr_BvAxiH_SoRaNe': {
    dev: "स्कन्द् (स्कन्दिँर्) शोषणे भ्वादिः",
    rom: "skand (skandiṁr) śoṣaṇe bhvādiḥ"
  },
  'skaB1_skaBiz_BvAxiH_prawibanXe': {
    dev: "स्कभ् (स्कभिँ) प्रतिबन्धे भ्वादिः",
    rom: "skabh (skabhiṁ) pratibandhe bhvādiḥ"
  },
  'sku1_skuF_kryAxiH_ApravaNe': {
    dev: "स्कु (स्कुञ्) आप्रवणे क्र्यादिः",
    rom: "sku (skuñ) āpravaṇe kryādiḥ"
  },
  'skux1_skuxiz_BvAxiH_ApravaNe': {
    dev: "स्कुद् (स्कुदिँ) आप्रवणे भ्वादिः",
    rom: "skud (skudiṁ) āpravaṇe bhvādiḥ"
  },
  'sKax1_sKaxaz_BvAxiH_sKaxane': {
    dev: "स्खद् (स्खदँ) स्खदने भ्वादिः",
    rom: "skhad (skhadaṁ) skhadane bhvādiḥ"
  },
  'sKal1_sKalaz_BvAxiH_saFcalane': {
    dev: "स्खल् (स्खलँ) सञ्चलने भ्वादिः",
    rom: "skhal (skhalaṁ) sañcalane bhvādiḥ"
  },
  'swak1_swakaz_BvAxiH_prawiGAwe': {
    dev: "स्तक् (स्तकँ) प्रतिघाते भ्वादिः",
    rom: "stak (stakaṁ) pratighāte bhvādiḥ"
  },
  'swana1_swana_curAxiH_xevaSabxe': {
    dev: "स्तन (स्तन) देवशब्दे चुरादिः",
    rom: "stana (stana) devaśabde curādiḥ"
  },
  'swan1_swanaz_BvAxiH_Sabxe': {
    dev: "स्तन् (स्तनँ) शब्दे भ्वादिः",
    rom: "stan (stanaṁ) śabde bhvādiḥ"
  },
  'swip1_swipaz_curAxiH_kRepe': {
    dev: "स्तिप् (स्तिपँ) क्षेपे चुरादिः",
    rom: "stip (stipaṁ) kṣepe curādiḥ"
  },
  'swim1_swimaz_xivAxiH_ArxrIBAve': {
    dev: "स्तिम् (स्तिमँ) आर्द्रीभावे दिवादिः",
    rom: "stim (stimaṁ) ārdrībhāve divādiḥ"
  },
  'swup1_swupaz_curAxiH_samucCrAye': {
    dev: "स्तुप् (स्तुपँ) समुच्छ्राये चुरादिः",
    rom: "stup (stupaṁ) samucchrāye curādiḥ"
  },
  'swUp1_swUpaz_xivAxiH_samucCrAye': {
    dev: "स्तूप् (स्तूपँ) समुच्छ्राये दिवादिः",
    rom: "stūp (stūpaṁ) samucchrāye divādiḥ"
  },
  'swq1_swqF_svAxiH_AcCAxane': {
    dev: "स्तृ (स्तृञ्) आच्छादने स्वादिः",
    rom: "stṛ (stṛñ) ācchādane svādiḥ"
  },
  'swqkR1_swqkRaz_BvAxiH_gawO': {
    dev: "स्तृक्ष् (स्तृक्षँ) गतौ भ्वादिः",
    rom: "stṛkṣ (stṛkṣaṁ) gatau bhvādiḥ"
  },
  'swqnhU1_swqnhU_wuxAxiH_hiMsAyAm': {
    dev: "स्तृन्हू (स्तृन्हू) हिंसायाम् तुदादिः",
    rom: "stṛnhū (stṛnhū) hiṃsāyām tudādiḥ"
  },
  'swqh1_swqhUz_wuxAxiH_hiMsAyAm': {
    dev: "स्तृह् (स्तृहूँ) हिंसायाम् तुदादिः",
    rom: "stṛh (stṛhūṁ) hiṃsāyām tudādiḥ"
  },
  'swQ1_swQF_kryAxiH_AcCAxane': {
    dev: "स्तॄ (स्तॄञ्) आच्छादने क्र्यादिः",
    rom: "stṝ (stṝñ) ācchādane kryādiḥ"
  },
  'swena1_swena_curAxiH_cOrye': {
    dev: "स्तेन (स्तेन) चौर्ये चुरादिः",
    rom: "stena (stena) caurye curādiḥ"
  },
  'swoma1_swoma_curAxiH_SlAGAyAm': {
    dev: "स्तोम (स्तोम) श्लाघायाम् चुरादिः",
    rom: "stoma (stoma) ślāghāyām curādiḥ"
  },
  'swyE1_swyE_BvAxiH_Sabxe': {
    dev: "स्त्यै (स्त्यै) शब्दे भ्वादिः",
    rom: "styai (styai) śabde bhvādiḥ"
  },
  'swyE1_swyE_BvAxiH_safGAwe': {
    dev: "स्त्यै (स्त्यै) सङ्घाते भ्वादिः",
    rom: "styai (styai) saṅghāte bhvādiḥ"
  },
  'sWag1_sWagez_BvAxiH_saMvaraNe': {
    dev: "स्थग् (स्थगेँ) संवरणे भ्वादिः",
    rom: "sthag (sthageṁ) saṃvaraṇe bhvādiḥ"
  },
  'sWal1_sWalaz_BvAxiH_sWAne': {
    dev: "स्थल् (स्थलँ) स्थाने भ्वादिः",
    rom: "sthal (sthalaṁ) sthāne bhvādiḥ"
  },
  'sWud1_sWudaz_wuxAxiH_saMvaraNe': {
    dev: "स्थुड् (स्थुडँ) संवरणे तुदादिः",
    rom: "sthuḍ (sthuḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'sWUla1_sWUla_curAxiH_paribqMhaNe': {
    dev: "स्थूल (स्थूल) परिबृंहणे चुरादिः",
    rom: "sthūla (sthūla) paribṛṃhaṇe curādiḥ"
  },
  'snit1_snitaz_curAxiH_snehane': {
    dev: "स्निट् (स्निटँ) स्नेहने चुरादिः",
    rom: "sniṭ (sniṭaṁ) snehane curādiḥ"
  },
  'spax1_spaxiz_BvAxiH_kiFciccalane': {
    dev: "स्पद् (स्पदिँ) किञ्चिच्चलने भ्वादिः",
    rom: "spad (spadiṁ) kiñciccalane bhvādiḥ"
  },
  'sparX1_sparXaz_BvAxiH_safGarRe': {
    dev: "स्पर्ध् (स्पर्धँ) सङ्घर्षे भ्वादिः",
    rom: "spardh (spardhaṁ) saṅgharṣe bhvādiḥ"
  },
  'spaS2_spaSaz_curAxiH_grahaNe': {
    dev: "स्पश् (स्पशँ) ग्रहणे चुरादिः",
    rom: "spaś (spaśaṁ) grahaṇe curādiḥ"
  },
  'spaS1_spaSaz_BvAxiH_bAXane': {
    dev: "स्पश् (स्पशँ) बाधने भ्वादिः",
    rom: "spaś (spaśaṁ) bādhane bhvādiḥ"
  },
  'spaS2_spaSaz_curAxiH_SleRaNe': {
    dev: "स्पश् (स्पशँ) श्लेषणे चुरादिः",
    rom: "spaś (spaśaṁ) śleṣaṇe curādiḥ"
  },
  'spaS2_spaSaz_curAxiH_saMSleRaNe': {
    dev: "स्पश् (स्पशँ) संश्लेषणे चुरादिः",
    rom: "spaś (spaśaṁ) saṃśleṣaṇe curādiḥ"
  },
  'spaS1_spaSaz_BvAxiH_sparSe': {
    dev: "स्पश् (स्पशँ) स्पर्शे भ्वादिः",
    rom: "spaś (spaśaṁ) sparśe bhvādiḥ"
  },
  'spud1_spudiz_curAxiH_parihAse': {
    dev: "स्पुड् (स्पुडिँ) परिहासे चुरादिः",
    rom: "spuḍ (spuḍiṁ) parihāse curādiḥ"
  },
  'spq1_spq_svAxiH_pAlane': {
    dev: "स्पृ (स्पृ) पालने स्वादिः",
    rom: "spṛ (spṛ) pālane svādiḥ"
  },
  'spq1_spq_svAxiH_prIwO': {
    dev: "स्पृ (स्पृ) प्रीतौ स्वादिः",
    rom: "spṛ (spṛ) prītau svādiḥ"
  },
  'spqS1_spqSaz_wuxAxiH_sparSe': {
    dev: "स्पृश् (स्पृशँ) स्पर्शे तुदादिः",
    rom: "spṛś (spṛśaṁ) sparśe tudādiḥ"
  },
  'spqha1_spqha_curAxiH_IpsAyAm': {
    dev: "स्पृह (स्पृह) ईप्सायाम् चुरादिः",
    rom: "spṛha (spṛha) īpsāyām curādiḥ"
  },
  'sPat1_sPatiz_BvAxiH_viSaraNe': {
    dev: "स्फट् (स्फटिँ) विशरणे भ्वादिः",
    rom: "sphaṭ (sphaṭiṁ) viśaraṇe bhvādiḥ"
  },
  'sPar1_sParaz_wuxAxiH_calane': {
    dev: "स्फर् (स्फरँ) चलने तुदादिः",
    rom: "sphar (spharaṁ) calane tudādiḥ"
  },
  'sPal1_sPalaz_wuxAxiH_calane': {
    dev: "स्फल् (स्फलँ) चलने तुदादिः",
    rom: "sphal (sphalaṁ) calane tudādiḥ"
  },
  'sPAy1_sPAyIz_BvAxiH_vqxXO': {
    dev: "स्फाय् (स्फायीँ) वृद्धौ भ्वादिः",
    rom: "sphāy (sphāyīṁ) vṛddhau bhvādiḥ"
  },
  'sPit1_sPitaz_curAxiH_anAxare': {
    dev: "स्फिट् (स्फिटँ) अनादरे चुरादिः",
    rom: "sphiṭ (sphiṭaṁ) anādare curādiḥ"
  },
  'sPit1_sPitaz_curAxiH_hiMsAyAm': {
    dev: "स्फिट् (स्फिटँ) हिंसायाम् चुरादिः",
    rom: "sphiṭ (sphiṭaṁ) hiṃsāyām curādiḥ"
  },
  'sPiwt1_sPiwtaz_curAxiH_hiMsAyAm': {
    dev: "स्फित्ट् (स्फित्टँ) हिंसायाम् चुरादिः",
    rom: "sphitṭ (sphitṭaṁ) hiṃsāyām curādiḥ"
  },
  'sPut4_sPutaz_curAxiH_Bexane': {
    dev: "स्फुट् (स्फुटँ) भेदने चुरादिः",
    rom: "sphuṭ (sphuṭaṁ) bhedane curādiḥ"
  },
  'sPut3_sPutaz_wuxAxiH_vikasane': {
    dev: "स्फुट् (स्फुटँ) विकसने तुदादिः",
    rom: "sphuṭ (sphuṭaṁ) vikasane tudādiḥ"
  },
  'sPut1_sPutaz_BvAxiH_vikasane': {
    dev: "स्फुट् (स्फुटँ) विकसने भ्वादिः",
    rom: "sphuṭ (sphuṭaṁ) vikasane bhvādiḥ"
  },
  'sPut2_sPutizr_BvAxiH_viSaraNe': {
    dev: "स्फुट् (स्फुटिँर्) विशरणे भ्वादिः",
    rom: "sphuṭ (sphuṭiṁr) viśaraṇe bhvādiḥ"
  },
  'sPud2_sPudaz_wuxAxiH_saMvaraNe': {
    dev: "स्फुड् (स्फुडँ) संवरणे तुदादिः",
    rom: "sphuḍ (sphuḍaṁ) saṃvaraṇe tudādiḥ"
  },
  'sPud3_sPudiz_curAxiH_parihAse': {
    dev: "स्फुड् (स्फुडिँ) परिहासे चुरादिः",
    rom: "sphuḍ (sphuḍiṁ) parihāse curādiḥ"
  },
  'sPud1_sPudiz_BvAxiH_vikasane': {
    dev: "स्फुड् (स्फुडिँ) विकसने भ्वादिः",
    rom: "sphuḍ (sphuḍiṁ) vikasane bhvādiḥ"
  },
  'sPur1_sPuraz_wuxAxiH_calane': {
    dev: "स्फुर् (स्फुरँ) चलने तुदादिः",
    rom: "sphur (sphuraṁ) calane tudādiḥ"
  },
  'sPur1_sPuraz_wuxAxiH_xIpwO': {
    dev: "स्फुर् (स्फुरँ) दीप्तौ तुदादिः",
    rom: "sphur (sphuraṁ) dīptau tudādiḥ"
  },
  'sPur1_sPuraz_wuxAxiH_saFcalane': {
    dev: "स्फुर् (स्फुरँ) सञ्चलने तुदादिः",
    rom: "sphur (sphuraṁ) sañcalane tudādiḥ"
  },
  'sPur1_sPuraz_wuxAxiH_sPuraNe': {
    dev: "स्फुर् (स्फुरँ) स्फुरणे तुदादिः",
    rom: "sphur (sphuraṁ) sphuraṇe tudādiḥ"
  },
  'sPurC1_sPurCAz_BvAxiH_viswqwO': {
    dev: "स्फुर्छ् (स्फुर्छाँ) विस्तृतौ भ्वादिः",
    rom: "sphurch (sphurchāṁ) vistṛtau bhvādiḥ"
  },
  'sPul1_sPulaz_wuxAxiH_calane': {
    dev: "स्फुल् (स्फुलँ) चलने तुदादिः",
    rom: "sphul (sphulaṁ) calane tudādiḥ"
  },
  'sPul1_sPulaz_wuxAxiH_saFcaye': {
    dev: "स्फुल् (स्फुलँ) सञ्चये तुदादिः",
    rom: "sphul (sphulaṁ) sañcaye tudādiḥ"
  },
  'sPul1_sPulaz_wuxAxiH_saFcalane': {
    dev: "स्फुल् (स्फुलँ) सञ्चलने तुदादिः",
    rom: "sphul (sphulaṁ) sañcalane tudādiḥ"
  },
  'sPUrj1_tuozsPUrjAz_BvAxiH_vajranirGoRe': {
    dev: "स्फूर्ज् (टुओँस्फूर्जाँ) वज्रनिर्घोषे भ्वादिः",
    rom: "sphūrj (ṭuoṁsphūrjāṁ) vajranirghoṣe bhvādiḥ"
  },
  'smi1_smif_BvAxiH_IRaxXasane': {
    dev: "स्मि (स्मिङ्) ईषद्धसने भ्वादिः",
    rom: "smi (smiṅ) īṣaddhasane bhvādiḥ"
  },
  'smit1_smitaz_curAxiH_anAxare': {
    dev: "स्मिट् (स्मिटँ) अनादरे चुरादिः",
    rom: "smiṭ (smiṭaṁ) anādare curādiḥ"
  },
  'smIl1_smIlaz_BvAxiH_nimeRaNe': {
    dev: "स्मील् (स्मीलँ) निमेषणे भ्वादिः",
    rom: "smīl (smīlaṁ) nimeṣaṇe bhvādiḥ"
  },
  'smurC1_smurCAz_BvAxiH_vismqwO': {
    dev: "स्मुर्छ् (स्मुर्छाँ) विस्मृतौ भ्वादिः",
    rom: "smurch (smurchāṁ) vismṛtau bhvādiḥ"
  },
  'smq1_smq_BvAxiH_AXyAne': {
    dev: "स्मृ (स्मृ) आध्याने भ्वादिः",
    rom: "smṛ (smṛ) ādhyāne bhvādiḥ"
  },
  'smq1_smq_BvAxiH_cinwAyAm': {
    dev: "स्मृ (स्मृ) चिन्तायाम् भ्वादिः",
    rom: "smṛ (smṛ) cintāyām bhvādiḥ"
  },
  'smq2_smq_svAxiH_prIwO': {
    dev: "स्मृ (स्मृ) प्रीतौ स्वादिः",
    rom: "smṛ (smṛ) prītau svādiḥ"
  },
  'smq2_smq_svAxiH_balane': {
    dev: "स्मृ (स्मृ) बलने स्वादिः",
    rom: "smṛ (smṛ) balane svādiḥ"
  },
  'syanx1_syanxUz_BvAxiH_prasravaNe': {
    dev: "स्यन्द् (स्यन्दूँ) प्रस्रवणे भ्वादिः",
    rom: "syand (syandūṁ) prasravaṇe bhvādiḥ"
  },
  'syanx1_syanxUz_BvAxiH_sravaNe': {
    dev: "स्यन्द् (स्यन्दूँ) स्रवणे भ्वादिः",
    rom: "syand (syandūṁ) sravaṇe bhvādiḥ"
  },
  'syam2_syamaz_curAxiH_viwarke': {
    dev: "स्यम् (स्यमँ) वितर्के चुरादिः",
    rom: "syam (syamaṁ) vitarke curādiḥ"
  },
  'syam1_syamuz_BvAxiH_Sabxe': {
    dev: "स्यम् (स्यमुँ) शब्दे भ्वादिः",
    rom: "syam (syamuṁ) śabde bhvādiḥ"
  },
  'srak1_srakiz_BvAxiH_gawO': {
    dev: "स्रक् (स्रकिँ) गतौ भ्वादिः",
    rom: "srak (srakiṁ) gatau bhvādiḥ"
  },
  'sranB1_sranBuz_BvAxiH_pramAxe': {
    dev: "स्रन्भ् (स्रन्भुँ) प्रमादे भ्वादिः",
    rom: "sranbh (sranbhuṁ) pramāde bhvādiḥ"
  },
  'sranB1_sranBuz_BvAxiH_viSvAse': {
    dev: "स्रन्भ् (स्रन्भुँ) विश्वासे भ्वादिः",
    rom: "sranbh (sranbhuṁ) viśvāse bhvādiḥ"
  },
  'srans1_sransuz_BvAxiH_aXaHpawane': {
    dev: "स्रन्स् (स्रन्सुँ) अधःपतने भ्वादिः",
    rom: "srans (sransuṁ) adhaḥpatane bhvādiḥ"
  },
  'srans1_sransuz_BvAxiH_avasraMsane': {
    dev: "स्रन्स् (स्रन्सुँ) अवस्रंसने भ्वादिः",
    rom: "srans (sransuṁ) avasraṃsane bhvādiḥ"
  },
  'srans1_sransuz_BvAxiH_pramAxe': {
    dev: "स्रन्स् (स्रन्सुँ) प्रमादे भ्वादिः",
    rom: "srans (sransuṁ) pramāde bhvādiḥ"
  },
  'sriv1_srivuz_xivAxiH_gawO': {
    dev: "स्रिव् (स्रिवुँ) गतौ दिवादिः",
    rom: "sriv (srivuṁ) gatau divādiḥ"
  },
  'sriv1_srivuz_xivAxiH_SoRaNe': {
    dev: "स्रिव् (स्रिवुँ) शोषणे दिवादिः",
    rom: "sriv (srivuṁ) śoṣaṇe divādiḥ"
  },
  'sru1_sru_BvAxiH_gawO': {
    dev: "स्रु (स्रु) गतौ भ्वादिः",
    rom: "sru (sru) gatau bhvādiḥ"
  },
  'srek1_srekqz_BvAxiH_gawO': {
    dev: "स्रेक् (स्रेकृँ) गतौ भ्वादिः",
    rom: "srek (srekṛṁ) gatau bhvādiḥ"
  },
  'srE1_srE_BvAxiH_pAke': {
    dev: "स्रै (स्रै) पाके भ्वादिः",
    rom: "srai (srai) pāke bhvādiḥ"
  },
  'svax1_svaxaz_curAxiH_AsvAxane': {
    dev: "स्वद् (स्वदँ) आस्वादने चुरादिः",
    rom: "svad (svadaṁ) āsvādane curādiḥ"
  },
  'svan1_svanaz_BvAxiH_Sabxe': {
    dev: "स्वन् (स्वनँ) शब्दे भ्वादिः",
    rom: "svan (svanaṁ) śabde bhvādiḥ"
  },
  'svara1_svara_curAxiH_AkRepe': {
    dev: "स्वर (स्वर) आक्षेपे चुरादिः",
    rom: "svara (svara) ākṣepe curādiḥ"
  },
  'svarw1_svarwaz_curAxiH_kqcCrajIvane': {
    dev: "स्वर्त् (स्वर्तँ) कृच्छ्रजीवने चुरादिः",
    rom: "svart (svartaṁ) kṛcchrajīvane curādiḥ"
  },
  'svarw1_svarwaz_curAxiH_gawyAm': {
    dev: "स्वर्त् (स्वर्तँ) गत्याम् चुरादिः",
    rom: "svart (svartaṁ) gatyām curādiḥ"
  },
  'svarx1_svarxaz_BvAxiH_AsvAxane': {
    dev: "स्वर्द् (स्वर्दँ) आस्वादने भ्वादिः",
    rom: "svard (svardaṁ) āsvādane bhvādiḥ"
  },
  'svAx1_svAxaz_BvAxiH_AsvAxane': {
    dev: "स्वाद् (स्वादँ) आस्वादने भ्वादिः",
    rom: "svād (svādaṁ) āsvādane bhvādiḥ"
  },
  'svq1_svq_BvAxiH_upawApe': {
    dev: "स्वृ (स्वृ) उपतापे भ्वादिः",
    rom: "svṛ (svṛ) upatāpe bhvādiḥ"
  },
  'svq1_svq_BvAxiH_Sabxe': {
    dev: "स्वृ (स्वृ) शब्दे भ्वादिः",
    rom: "svṛ (svṛ) śabde bhvādiḥ"
  },
  'svQ1_svQ_kryAxiH_hiMsAyAm': {
    dev: "स्वॄ (स्वॄ) हिंसायाम् क्र्यादिः",
    rom: "svṝ (svṝ) hiṃsāyām kryādiḥ"
  },
  'hag1_hagez_BvAxiH_saMvaraNe': {
    dev: "हग् (हगेँ) संवरणे भ्वादिः",
    rom: "hag (hageṁ) saṃvaraṇe bhvādiḥ"
  },
  'hat1_hataz_BvAxiH_xIpwO': {
    dev: "हट् (हटँ) दीप्तौ भ्वादिः",
    rom: "haṭ (haṭaṁ) dīptau bhvādiḥ"
  },
  'haT1_haTaz_BvAxiH_pluwO': {
    dev: "हठ् (हठँ) प्लुतौ भ्वादिः",
    rom: "haṭh (haṭhaṁ) plutau bhvādiḥ"
  },
  'haT1_haTaz_BvAxiH_SafkubanXane': {
    dev: "हठ् (हठँ) शङ्कुबन्धने भ्वादिः",
    rom: "haṭh (haṭhaṁ) śaṅkubandhane bhvādiḥ"
  },
  'haT1_haTaz_BvAxiH_SaTawve': {
    dev: "हठ् (हठँ) शठत्वे भ्वादिः",
    rom: "haṭh (haṭhaṁ) śaṭhatve bhvādiḥ"
  },
  'hax1_haxaz_BvAxiH_purIRowsarge': {
    dev: "हद् (हदँ) पुरीषोत्सर्गे भ्वादिः",
    rom: "had (hadaṁ) purīṣotsarge bhvādiḥ"
  },
  'han1_hanaz_axAxiH_gawO': {
    dev: "हन् (हनँ) गतौ अदादिः",
    rom: "han (hanaṁ) gatau adādiḥ"
  },
  'han1_hanaz_axAxiH_hiMsAyAm': {
    dev: "हन् (हनँ) हिंसायाम् अदादिः",
    rom: "han (hanaṁ) hiṃsāyām adādiḥ"
  },
  'hamm1_hammaz_BvAxiH_gawO': {
    dev: "हम्म् (हम्मँ) गतौ भ्वादिः",
    rom: "hamm (hammaṁ) gatau bhvādiḥ"
  },
  'hay1_hayaz_BvAxiH_kAnwO': {
    dev: "हय् (हयँ) कान्तौ भ्वादिः",
    rom: "hay (hayaṁ) kāntau bhvādiḥ"
  },
  'hay1_hayaz_BvAxiH_gawO': {
    dev: "हय् (हयँ) गतौ भ्वादिः",
    rom: "hay (hayaṁ) gatau bhvādiḥ"
  },
  'hary1_haryaz_BvAxiH_kAnwO': {
    dev: "हर्य् (हर्यँ) कान्तौ भ्वादिः",
    rom: "hary (haryaṁ) kāntau bhvādiḥ"
  },
  'hary1_haryaz_BvAxiH_gawO': {
    dev: "हर्य् (हर्यँ) गतौ भ्वादिः",
    rom: "hary (haryaṁ) gatau bhvādiḥ"
  },
  'hal1_halaz_BvAxiH_vileKane': {
    dev: "हल् (हलँ) विलेखने भ्वादिः",
    rom: "hal (halaṁ) vilekhane bhvādiḥ"
  },
  'has2_hasaz_BvAxiH_Sabxe': {
    dev: "हस् (हसँ) शब्दे भ्वादिः",
    rom: "has (hasaṁ) śabde bhvādiḥ"
  },
  'has1_hasez_BvAxiH_hasane': {
    dev: "हस् (हसेँ) हसने भ्वादिः",
    rom: "has (haseṁ) hasane bhvādiḥ"
  },
  'hA2_ozhAk_juhowyAxiH_wyAge': {
    dev: "हा (ओँहाक्) त्यागे जुहोत्यादिः",
    rom: "hā (oṁhāk) tyāge juhotyādiḥ"
  },
  'hA1_ozhAf_juhowyAxiH_gawO': {
    dev: "हा (ओँहाङ्) गतौ जुहोत्यादिः",
    rom: "hā (oṁhāṅ) gatau juhotyādiḥ"
  },
  'hi1_hi_svAxiH_gawO': {
    dev: "हि (हि) गतौ स्वादिः",
    rom: "hi (hi) gatau svādiḥ"
  },
  'hi1_hi_svAxiH_vqxXO': {
    dev: "हि (हि) वृद्धौ स्वादिः",
    rom: "hi (hi) vṛddhau svādiḥ"
  },
  'hikk1_hikkaz_BvAxiH_avyakwe_Sabxe': {
    dev: "हिक्क् (हिक्कँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "hikk (hikkaṁ) avyakte_śabde bhvādiḥ"
  },
  'hid1_hidiz_BvAxiH_anAxare': {
    dev: "हिड् (हिडिँ) अनादरे भ्वादिः",
    rom: "hiḍ (hiḍiṁ) anādare bhvādiḥ"
  },
  'hid1_hidiz_BvAxiH_gawO': {
    dev: "हिड् (हिडिँ) गतौ भ्वादिः",
    rom: "hiḍ (hiḍiṁ) gatau bhvādiḥ"
  },
  'hil1_hilaz_wuxAxiH_BAvakaraNe': {
    dev: "हिल् (हिलँ) भावकरणे तुदादिः",
    rom: "hil (hilaṁ) bhāvakaraṇe tudādiḥ"
  },
  'hil1_hilaz_wuxAxiH_hAvakaraNe': {
    dev: "हिल् (हिलँ) हावकरणे तुदादिः",
    rom: "hil (hilaṁ) hāvakaraṇe tudādiḥ"
  },
  'hiv1_hiviz_BvAxiH_prINane': {
    dev: "हिव् (हिविँ) प्रीणने भ्वादिः",
    rom: "hiv (hiviṁ) prīṇane bhvādiḥ"
  },
  'hiRk1_hiRkaz_curAxiH_hiMsAyAm': {
    dev: "हिष्क् (हिष्कँ) हिंसायाम् चुरादिः",
    rom: "hiṣk (hiṣkaṁ) hiṃsāyām curādiḥ"
  },
  'his2_hisiz_curAxiH_hiMsAyAm': {
    dev: "हिस् (हिसिँ) हिंसायाम् चुरादिः",
    rom: "his (hisiṁ) hiṃsāyām curādiḥ"
  },
  'his1_hisiz_ruXAxiH_hiMsAyAm': {
    dev: "हिस् (हिसिँ) हिंसायाम् रुधादिः",
    rom: "his (hisiṁ) hiṃsāyām rudhādiḥ"
  },
  'hu1_hu_juhowyAxiH_axane': {
    dev: "हु (हु) अदने जुहोत्यादिः",
    rom: "hu (hu) adane juhotyādiḥ"
  },
  'hu1_hu_juhowyAxiH_xAne': {
    dev: "हु (हु) दाने जुहोत्यादिः",
    rom: "hu (hu) dāne juhotyādiḥ"
  },
  'hud3_hudaz_wuxAxiH_nimajjane': {
    dev: "हुड् (हुडँ) निमज्जने तुदादिः",
    rom: "huḍ (huḍaṁ) nimajjane tudādiḥ"
  },
  'hud3_hudaz_wuxAxiH_safGAwe': {
    dev: "हुड् (हुडँ) सङ्घाते तुदादिः",
    rom: "huḍ (huḍaṁ) saṅghāte tudādiḥ"
  },
  'hud3_hudaz_wuxAxiH_sahane': {
    dev: "हुड् (हुडँ) सहने तुदादिः",
    rom: "huḍ (huḍaṁ) sahane tudādiḥ"
  },
  'hud1_hudiz_BvAxiH_varaNe': {
    dev: "हुड् (हुडिँ) वरणे भ्वादिः",
    rom: "huḍ (huḍiṁ) varaṇe bhvādiḥ"
  },
  'hud1_hudiz_BvAxiH_safGAwe': {
    dev: "हुड् (हुडिँ) सङ्घाते भ्वादिः",
    rom: "huḍ (huḍiṁ) saṅghāte bhvādiḥ"
  },
  'hud1_hudiz_BvAxiH_haraNe': {
    dev: "हुड् (हुडिँ) हरणे भ्वादिः",
    rom: "huḍ (huḍiṁ) haraṇe bhvādiḥ"
  },
  'hud2_hudqz_BvAxiH_gawO': {
    dev: "हुड् (हुडृँ) गतौ भ्वादिः",
    rom: "huḍ (huḍṛṁ) gatau bhvādiḥ"
  },
  'hurC1_hurCAz_BvAxiH_kOtilye': {
    dev: "हुर्छ् (हुर्छाँ) कौटिल्ये भ्वादिः",
    rom: "hurch (hurchāṁ) kauṭilye bhvādiḥ"
  },
  'hul1_hulaz_BvAxiH_gawO': {
    dev: "हुल् (हुलँ) गतौ भ्वादिः",
    rom: "hul (hulaṁ) gatau bhvādiḥ"
  },
  'hul1_hulaz_BvAxiH_saMvaraNe': {
    dev: "हुल् (हुलँ) संवरणे भ्वादिः",
    rom: "hul (hulaṁ) saṃvaraṇe bhvādiḥ"
  },
  'hul1_hulaz_BvAxiH_hiMsAyAm': {
    dev: "हुल् (हुलँ) हिंसायाम् भ्वादिः",
    rom: "hul (hulaṁ) hiṃsāyām bhvādiḥ"
  },
  'hUd1_hUdqz_BvAxiH_gawO': {
    dev: "हूड् (हूडृँ) गतौ भ्वादिः",
    rom: "hūḍ (hūḍṛṁ) gatau bhvādiḥ"
  },
  'hq2_hq_juhowyAxiH_prasahyakaraNe': {
    dev: "हृ (हृ) प्रसह्यकरणे जुहोत्यादिः",
    rom: "hṛ (hṛ) prasahyakaraṇe juhotyādiḥ"
  },
  'hq1_hqF_BvAxiH_haraNe': {
    dev: "हृ (हृञ्) हरणे भ्वादिः",
    rom: "hṛ (hṛñ) haraṇe bhvādiḥ"
  },
  'hqR2_hqRaz_xivAxiH_wuRtO': {
    dev: "हृष् (हृषँ) तुष्टौ दिवादिः",
    rom: "hṛṣ (hṛṣaṁ) tuṣṭau divādiḥ"
  },
  'hqR1_hqRuz_BvAxiH_alIke': {
    dev: "हृष् (हृषुँ) अलीके भ्वादिः",
    rom: "hṛṣ (hṛṣuṁ) alīke bhvādiḥ"
  },
  'heT2_heTaz_kryAxiH_BUwaprAxurBAve': {
    dev: "हेठ् (हेठँ) भूतप्रादुर्भावे क्र्यादिः",
    rom: "heṭh (heṭhaṁ) bhūtaprādurbhāve kryādiḥ"
  },
  'heT1_heTaz_BvAxiH_vibAXAyAm': {
    dev: "हेठ् (हेठँ) विबाधायाम् भ्वादिः",
    rom: "heṭh (heṭhaṁ) vibādhāyām bhvādiḥ"
  },
  'hed2_hedaz_BvAxiH_vibAXAyAm': {
    dev: "हेड् (हेडँ) विबाधायाम् भ्वादिः",
    rom: "heḍ (heḍaṁ) vibādhāyām bhvādiḥ"
  },
  'hed2_hedaz_BvAxiH_veRtane': {
    dev: "हेड् (हेडँ) वेष्टने भ्वादिः",
    rom: "heḍ (heḍaṁ) veṣṭane bhvādiḥ"
  },
  'hed1_hedqz_BvAxiH_anAxare': {
    dev: "हेड् (हेडृँ) अनादरे भ्वादिः",
    rom: "heḍ (heḍṛṁ) anādare bhvādiḥ"
  },
  'heR1_heRqz_BvAxiH_avyakwe_Sabxe': {
    dev: "हेष् (हेषृँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "heṣ (heṣṛṁ) avyakte_śabde bhvādiḥ"
  },
  'hod1_hodqz_BvAxiH_anAxare': {
    dev: "होड् (होडृँ) अनादरे भ्वादिः",
    rom: "hoḍ (hoḍṛṁ) anādare bhvādiḥ"
  },
  'hod1_hodqz_BvAxiH_gawO': {
    dev: "होड् (होडृँ) गतौ भ्वादिः",
    rom: "hoḍ (hoḍṛṁ) gatau bhvādiḥ"
  },
  'hOd1_hOdqz_BvAxiH_gawO': {
    dev: "हौड् (हौडृँ) गतौ भ्वादिः",
    rom: "hauḍ (hauḍṛṁ) gatau bhvādiḥ"
  },
  'hnu1_hnuf_axAxiH_apanayane': {
    dev: "ह्नु (ह्नुङ्) अपनयने अदादिः",
    rom: "hnu (hnuṅ) apanayane adādiḥ"
  },
  'hmal1_hmalaz_BvAxiH_calane': {
    dev: "ह्मल् (ह्मलँ) चलने भ्वादिः",
    rom: "hmal (hmalaṁ) calane bhvādiḥ"
  },
  'hrag1_hragez_BvAxiH_saMvaraNe': {
    dev: "ह्रग् (ह्रगेँ) संवरणे भ्वादिः",
    rom: "hrag (hrageṁ) saṃvaraṇe bhvādiḥ"
  },
  'hras1_hrasaz_BvAxiH_Sabxe': {
    dev: "ह्रस् (ह्रसँ) शब्दे भ्वादिः",
    rom: "hras (hrasaṁ) śabde bhvādiḥ"
  },
  'hrAx1_hrAxaz_BvAxiH_avyakwe_Sabxe': {
    dev: "ह्राद् (ह्रादँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "hrād (hrādaṁ) avyakte_śabde bhvādiḥ"
  },
  'hrI1_hrI_juhowyAxiH_lajjAyAm': {
    dev: "ह्री (ह्री) लज्जायाम् जुहोत्यादिः",
    rom: "hrī (hrī) lajjāyām juhotyādiḥ"
  },
  'hrIC1_hrICaz_BvAxiH_lajjAyAm': {
    dev: "ह्रीछ् (ह्रीछँ) लज्जायाम् भ्वादिः",
    rom: "hrīch (hrīchaṁ) lajjāyām bhvādiḥ"
  },
  'hreR1_hreRqz_BvAxiH_gawO': {
    dev: "ह्रेष् (ह्रेषृँ) गतौ भ्वादिः",
    rom: "hreṣ (hreṣṛṁ) gatau bhvādiḥ"
  },
  'hlag1_hlagez_BvAxiH_saMvaraNe': {
    dev: "ह्लग् (ह्लगेँ) संवरणे भ्वादिः",
    rom: "hlag (hlageṁ) saṃvaraṇe bhvādiḥ"
  },
  'hlap1_hlapaz_curAxiH_vyakwAyAM_vAci': {
    dev: "ह्लप् (ह्लपँ) व्यक्तायां_वाचि चुरादिः",
    rom: "hlap (hlapaṁ) vyaktāyāṃ_vāci curādiḥ"
  },
  'hlas1_hlasaz_BvAxiH_Sabxe': {
    dev: "ह्लस् (ह्लसँ) शब्दे भ्वादिः",
    rom: "hlas (hlasaṁ) śabde bhvādiḥ"
  },
  'hlAx1_hlAxIz_BvAxiH_avyakwe_Sabxe': {
    dev: "ह्लाद् (ह्लादीँ) अव्यक्ते_शब्दे भ्वादिः",
    rom: "hlād (hlādīṁ) avyakte_śabde bhvādiḥ"
  },
  'hlAx1_hlAxIz_BvAxiH_suKe': {
    dev: "ह्लाद् (ह्लादीँ) सुखे भ्वादिः",
    rom: "hlād (hlādīṁ) sukhe bhvādiḥ"
  },
  'hval1_hvalaz_BvAxiH_calane': {
    dev: "ह्वल् (ह्वलँ) चलने भ्वादिः",
    rom: "hval (hvalaṁ) calane bhvādiḥ"
  },
  'hvq1_hvq_BvAxiH_kOtilye': {
    dev: "ह्वृ (ह्वृ) कौटिल्ये भ्वादिः",
    rom: "hvṛ (hvṛ) kauṭilye bhvādiḥ"
  },
  'hve1_hveF_BvAxiH_Sabxe': {
    dev: "ह्वे (ह्वेञ्) शब्दे भ्वादिः",
    rom: "hve (hveñ) śabde bhvādiḥ"
  },
  'hve1_hveF_BvAxiH_sparXAyAm': {
    dev: "ह्वे (ह्वेञ्) स्पर्धायाम् भ्वादिः",
    rom: "hve (hveñ) spardhāyām bhvādiḥ"
  }
};

var labels = {
  'lbl-upasargaH': {
    dev: 'उपसर्गः',
    rom: 'Prefix'
  },
  'lbl-XAwu': {
    dev: 'धातु',
    rom: 'Verbal Root'
  },
  'lbl-prayogaH': {
    dev: 'प्रयोगः',
    rom: 'Voice'
  },
  'lbl-karwari': {
    dev: 'कर्तरि',
    rom: 'Active'
  },
  'lbl-karmaNi': {
    dev: 'कर्मणि/भावकर्मणि',
    rom: 'Passive/Impersonal'
  },
  'lbl-paxI': {
    dev: 'पदी',
    rom: 'Padī'
  },
  'lbl-parasmEpaxI': {
    dev: 'परस्मैपदी',
    rom: 'Parasmaipadī'
  },
  'lbl-AwmanepaxI': {
    dev: 'आत्मनेपदी',
    rom: 'Ātmanepadī'
  },
  'lbl-uBayapaxI': {
    dev: 'उभयपदी',
    rom: 'Ubhayapadī'
  },
  'lbl-Nic': {
    dev: 'णिजन्तम्',
    rom: 'Causative'
  }
};

var submit_label = {
  dev: 'रूपाणि दृश्यताम्',
  rom: 'Generate Forms'
};

var waiting_label = {
  dev: 'कृपया प्रतीक्ष्यताम्...',
  rom: 'Please wait...'
};