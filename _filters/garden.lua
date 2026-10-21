-- garden.lua（2026-10-17 デザイン試作）
-- 1) 本文の先頭の「# 題」が frontmatter の title と同じなら落とす（題が2回出ていた＝61本中 md に本文の # があるのは48本）。
--    違うとき（本文の題にだけ数式がある等）は残す＝黙って中身を変えない。
-- 2) 記事（記事/ の下）の終わりに「庭の一覧へ」の導線を足す。
local function norm(s) return (s:gsub("%s+", "")) end

function Pandoc(doc)
  local t = doc.meta.title and pandoc.utils.stringify(doc.meta.title) or nil
  local b = doc.blocks
  if t and #b > 0 and b[1].t == "Header" and b[1].level == 1 then
    if norm(pandoc.utils.stringify(b[1].content)) == norm(t) then
      b:remove(1)
    else
      io.stderr:write("[garden.lua] 題が違うので本文の # を残した: " .. (quarto and quarto.doc.input_file or "?") .. "\n")
    end
  end
  local f = quarto and quarto.doc.input_file or ""
  if f:find("記事") then
    b:insert(pandoc.RawBlock("html",
      '<nav class="garden-return" aria-label="庭の中の移動"><a href="../index.html">数学解説の庭の一覧へ戻る</a></nav>'))
  end
  return doc
end
