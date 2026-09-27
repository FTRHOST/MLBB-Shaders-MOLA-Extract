# MOLA.global.base_1242.1.dat — Shader Export

## Info File Asal

| Detail | Value |
|--------|-------|
| **Nama File** | `MOLA.global.base_1242.1.dat` |
| **Lokasi Asal** | `/home/petwirkepo/Downloads/MOLA.global.base_1242.1.dat` |
| **Ukuran File** | 28 GB |
| **Format** | Unity Assets Bundle (UnityFS) |
| **Versi Unity** | 2019.4.33f1 |
| **Engine Player** | 5.x.x |
| **Nama Bundle Internal** | `assets/res_version/android/art/android/shadervariants_add.unity3d` |
| **Game** | Mobile Legends: Bang Bang (MLBB) |
| **Rendering Pipeline** | Theseus |

## Software & Tools

| Tool | Versi | Fungsi |
|------|-------|--------|
| **Python** | 3.x | Bahasa pemrograman utama |
| **UnityPy** | 1.25.3 | Membaca & mengekstrak Unity Assets Bundle |
| **Unity Editor** | 2019.4.33f1 | Engine asli yang membuat bundle |

## Isi Ekspor

| Jenis | Jumlah | Total Ukuran |
|-------|:------:|:------------:|
| **Shader** | 721 | ~992.7 MB |
| **ComputeShader** | 7 | — |
| **Total** | **728** | — |

### Kategori Shader (berdasarkan folder internal)

| Folder | Jumlah | Deskripsi |
|--------|:------:|-----------|
| `shader_add/pbr` | 135 | Shader PBR untuk karakter, senjata, armor |
| `shadertheseus/effect/oldtotheseuseffectshader` | 57 | Efek visual lama (Theseus) |
| `shadertheseus/character/theseus_pbr_common` | 56 | Shader PBR karakter umum |
| `shader_add/ui` | 48 | Shader untuk UI (tombol, teks, slider) |
| `shader_add/effect` | 35 | Efek visual umum |
| `shadertheseus/character/theseus_pbr_anisotropic` | 34 | Shader anisotropic (rambut, metal) |
| `shadertheseus/effect/fromoldeffectshader` | 32 | Efek dari sistem lama |
| `shadertheseus/scene` | 30 | Shader untuk scene/lingkungan |
| `shader_add/bloomhdr` | 26 | Post-processing Bloom HDR |
| `shader_add/npr` | 24 | Non-Photorealistic Rendering |
| `shadertheseus/effect` | 20 | Efek visual tambahan |
| `shadertheseus/character/theseus_pbr_skin` | 19 | Shader kulit karakter |
| `shadertheseus/character/theseus_pbr_crystal` | 15 | Shader crystal/metalik |
| `shadertheseus/character/theseus_unlit_common` | 13 | Shader unlit (tanpa lighting) |
| `shadertheseus/character/theseus_pan` | 11 | Shader pan/roll untuk karakter |
| `shader_add/scene/heroshow` | 10 | Tampilan hero di lobby |
| `shader_add/ui/text` | 10 | Shader text UI |
| `shader_add/moshi` | 9 | Shader khusus (misalnya Moshi) |
| `shader_add/prometheus/battlehero` | 8 | Shader battle hero Prometheus |
| Lainnya | ~89 | Sisanya (scene, particle, dll.) |

### Contoh Shader yang Diekstrak

| Nama File | Ukuran | Deskripsi |
|-----------|:------:|-----------|
| `BloomHDR_Hero_Hero_Pbr_Show2.0_Laser.shader` | 5.9 MB | Bloom HDR effect laser hero |
| `BloomHDR_Hero_Hero_Pbr_Show2.0_Alpha.shader` | 2.9 MB | Bloom HDR alpha channel |
| `BloomHDR_Hero_Hero_Pbr_Show2.0_Hair.shader` | 2.8 MB | Bloom HDR untuk rambut |
| `<effect>_ML_uv_ParticleFx_Pa_Blend_ND_Dissolve.shader` | 1.6 MB | Particle blend dissolve effect |
| `<effect>_ML_uv_ParticleFx_Pa_Blend_Alpha_ND.shader` | 1.6 MB | Particle blend alpha effect |
| `<effect>_ML_uv_ParticleFx_Pa_Add_ND_Dissolve.shader` | 1.2 MB | Particle additive dissolve |

## Struktur Setiap File Shader

Setiap file `.shader` berisi:
- **Kode GLSL lengkap** (vertex + fragment program)
- **Beberapa SubProgram** untuk GPU tier berbeda (gles3 hw_tier00, hw_tier01, gles hw_tier00, hw_tier01)
- **Uniform variables** (_Time, _MainTex, _CameraShakeParams, dll.)
- **Properties** blok (kosong untuk beberapa shader yang di-compile)

## Hubungan dengan File Lain

| File | Peran | Jumlah Shader |
|------|-------|:---:|
| `MOLA.global.base_1242.1.dat` (diekstrak di folder ini) | Library shader internal MLBB | 721 |
| `ShaderVariants.unity3d` | Runtime shader variants | 955 |
| `PVP_MChampionPBR_ob_add.unity3d` | Scene PVP yang menggunakan shader | 20 unik dari 199 material |

- **MOLA.dat** dan **ShaderVariants.unity3d** memiliki **1 shader yang sama** dari 1,676 total
- Scene PVP_MChampionPBR merujuk shader dari `ShaderVariants.unity3d`, bukan dari MOLA.dat
- **Keduanya adalah bundle shader yang berbeda** dalam game MLBB

## Cara Membaca Shader Ini

1. **Text Editor**: Buka file `.shader` dengan VS Code, Notepad++, atau Sublime Text
2. **Cari shader tertentu**:
   ```bash
   grep -r "Shader \"Name\"" MOLA_extracted/
   ```
3. **Filter berdasarkan kategori**:
   ```bash
   ls MOLA_extracted/ | grep "PBR"      # Shader PBR
   ls MOLA_extracted/ | grep "Bloom"    # Bloom HDR
   ls MOLA_extracted/ | grep "Particle" # Particle effects
   ls MOLA_extracted/ | grep "ui"       # UI shaders
   ```

## Cara Menggunakan Shader Ini

### Import ke Unity
1. Salin file `.shader` ke folder `Assets/Shaders/` di project Unity
2. Buka material → assign shader ke field `Shader`
3. Pastikan Unity version compatible (2019.4.x)

### Reverse Engineering
1. Analisis uniform variables untuk memahami parameter yang digunakan
2. Pelajari SubProgram untuk memahami GPU tier compatibility
3. Bandingkan shader tiap kategori untuk memahami teknik rendering MLBB

### Modding
1. Edit kode GLSL di file `.shader`
2. Ganti texture references (`_MainTex`, `_WorleyTex`, dll.)
3. Ubah color, lighting, atau effect parameters

## Peringatan

- File shader ini adalah **hak cipta** MLBB (Moonton)
- Gunakan untuk **educational/research purposes only**
- Jangan distribusikan ulang tanpa izin

## Generated By

```
Tool: UnityPy 1.25.3 (Python)
Command: env = UnityPy.load('MOLA.global.base_1242.1.dat')
         for obj in env.files[...].get_objects():
             if obj.type.name in ('Shader', 'ComputeShader'):
                 obj.read().export()
Date: September 2026
```
