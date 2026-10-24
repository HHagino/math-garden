// _sitemap_textbooks.ts — post-render（_quarto.yml の project.post-render）
// 2026-10-22：Quarto の sitemap.xml は「組んだ頁」だけで作られ、resources で写した 教科書/ の HTML は載らない
//   （quarto 1.9.37 の updateSitemap は render の出力ファイルだけを並べる・post-render はその後に走る）。
//   ここで docs/教科書/ の *.html を sitemap.xml に書き足す。すでに同じ <loc> があれば足さない（何度走っても同じ結果）。
//   loc の書き方は Quarto に合わせる（site-url ＋ 出力からの相対パス・日本語はそのまま）。lastmod はソース（教科書/）の更新時刻。
const outDir = Deno.env.get("QUARTO_PROJECT_OUTPUT_DIR") ?? "docs";
const sitemap = `${outDir}/sitemap.xml`;
const base = "https://hhagino.github.io/math-garden/";
const top = "教科書";

let xml: string;
try {
  xml = Deno.readTextFileSync(sitemap);
} catch {
  console.log("sitemap.xml が無いので何もしない");
  Deno.exit(0);
}

const found: string[] = [];
function walk(rel: string) {
  for (const e of Deno.readDirSync(`${outDir}/${rel}`)) {
    const r = `${rel}/${e.name}`;
    if (e.isDirectory) walk(r);
    else if (e.isFile && e.name.endsWith(".html")) found.push(r);
  }
}
try { walk(top); } catch { /* 教科書/ が無ければ何もしない */ }
found.sort();

const esc = (s: string) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
let added = 0;
let entries = "";
for (const rel of found) {
  const loc = esc(base + rel);
  if (xml.includes(`<loc>${loc}</loc>`)) continue;
  let mtime: Date | null = null;
  try { mtime = Deno.statSync(rel).mtime; } catch { /* ソースが無ければ出力の時刻 */ }
  if (!mtime) { try { mtime = Deno.statSync(`${outDir}/${rel}`).mtime; } catch { /* 無し */ } }
  entries += `  <url>\n    <loc>${loc}</loc>\n    <lastmod>${(mtime ?? new Date(0)).toISOString()}</lastmod>\n  </url>\n`;
  added++;
}
if (added) {
  const i = xml.lastIndexOf("</urlset>");
  if (i < 0) { console.log("sitemap.xml に </urlset> が無い：書き足さない"); Deno.exit(1); }
  xml = xml.slice(0, i) + entries + xml.slice(i);
  Deno.writeTextFileSync(sitemap, xml);
}
console.log(`sitemap.xml：教科書/ の HTML ${found.length} 本のうち ${added} 本を書き足した`);
