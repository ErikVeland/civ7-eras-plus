// Add the Custom preset to the PLAIN mirror (bbcode file already done).
// Anchor on the Modern Stretch entry (English token) per section. Run once.
import fs from "fs";
const T = {
  "Simplified Chinese": ["自定义（分时代）", "独立设置每个时代（远古、探索、现代）的长度。"],
  "Traditional Chinese": ["自訂（分時代）", "獨立設定每個時代（遠古、探索、現代）的長度。"],
  "Japanese": ["カスタム（時代別）", "古代・探索・近代の長さを個別に設定できます。"],
  "Korean": ["사용자 지정(시대별)", "고대·탐험·현대 길이를 개별적으로 설정합니다."],
  "Thai": ["กำหนดเอง (แยกยุค)", "ตั้งความยาวของยุคโบราณ ยุคสำรวจ และยุคใหม่แยกกัน"],
  "Indonesian": ["Kustom (per-era)", "Atur panjang era Antik, Eksplorasi, dan Modern secara terpisah."],
  "Malay": ["Tersuai (setiap era)", "Tetapkan panjang era Antiquity, Exploration dan Modern secara berasingan."],
  "Bulgarian": ["Персонализиран (по епоха)", "Задайте дължината на Античност, Проучване и Модерна епоха поотделно."],
  "Czech": ["Vlastní (podle éry)", "Nastavte délku starověku, průzkumu a moderní éry samostatně."],
  "Danish": ["Tilpasset (pr. æra)", "Indstil længden af oldtid, udforskning og moderne æra uafhængigt."],
  "German": ["Benutzerdefiniert (pro Ära)", "Lege die Länge von Antike, Erkundung und Moderne einzeln fest."],
  "English": ["Custom (per-age)", "Set the length of the Antiquity, Exploration, and Modern ages independently."],
  "Spanish - Spain": ["Personalizado (por era)", "Define la duración de las eras de Antigüedad, Exploración y Moderna por separado."],
  "Spanish - Latin America": ["Personalizado (por era)", "Define la duración de las eras de Antigüedad, Exploración y Moderna por separado."],
  "Greek": ["Προσαρμοσμένο (ανά εποχή)", "Ορίστε ξεχωριστά τη διάρκεια Αρχαιότητας, Εξερεύνησης και Σύγχρονης εποχής."],
  "French": ["Personnalisé (par ère)", "Définissez séparément la durée des ères Antiquité, Exploration et Moderne."],
  "Italian": ["Personalizzato (per era)", "Imposta separatamente la durata delle ere Antichità, Esplorazione e Moderna."],
  "Hungarian": ["Egyéni (koronként)", "Állítsd be külön az Ókor, a Felfedezés és a Modern kor hosszát."],
  "Dutch": ["Aangepast (per tijdperk)", "Stel de lengte van de Oudheid-, Verkennings- en Moderne tijdperken apart in."],
  "Norwegian": ["Tilpasset (per æra)", "Angi lengden på Antikken, Utforskning og Moderne æra uavhengig."],
  "Polish": ["Niestandardowy (na erę)", "Ustaw długość ery starożytności, eksploracji i nowożytnej osobno."],
  "Portuguese - Portugal": ["Personalizado (por era)", "Define a duração das eras da Antiguidade, Exploração e Moderna separadamente."],
  "Portuguese - Brazil": ["Personalizado (por era)", "Defina a duração das eras da Antiguidade, Exploração e Moderna separadamente."],
  "Romanian": ["Personalizat (pe eră)", "Setează separat durata erelor Antichitate, Explorare și Modernă."],
  "Russian": ["Свой (по эпохам)", "Задайте длину Античности, Освоения и Современности по отдельности."],
  "Finnish": ["Mukautettu (aikakausittain)", "Aseta antiikin, tutkimusmatkojen ja modernin aikakauden pituus erikseen."],
  "Swedish": ["Anpassad (per era)", "Ställ in längden på Antiken, Utforskning och Moderna eran separat."],
  "Turkish": ["Özel (çağ başına)", "Antik, Keşif ve Modern çağların uzunluğunu ayrı ayrı ayarla."],
  "Vietnamese": ["Tùy chỉnh (theo thời đại)", "Đặt độ dài của thời đại Cổ đại, Khám phá và Hiện đại riêng biệt."],
  "Ukrainian": ["Власний (за епохами)", "Задайте довжину Античності, Дослідження та Сучасності окремо."],
};
const path = "workshop-description-translations.md";
const parts = fs.readFileSync(path, "utf8").split(/\n(?=## )/);
let n = 0;
const out = parts.map((chunk) => {
  const header = (chunk.match(/^## (.+)$/m) || [])[1]?.trim();
  const entry = header && T[header];
  if (!entry) return chunk;
  if (chunk.includes(`[b]${entry[0]}`)) return chunk; // already present
  const lines = chunk.split("\n");
  const idx = lines.findIndex((l) => l.startsWith("[*][b]Modern Stretch"));
  if (idx < 0) return chunk;
  lines.splice(idx + 1, 0, `[*][b]${entry[0]}:[/b] ${entry[1]}`);
  n++;
  return lines.join("\n");
});
fs.writeFileSync(path, out.join("\n"));
console.log(`plain mirror: inserted into ${n} sections`);
