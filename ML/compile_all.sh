#!/bin/bash

# 현재 폴더 및 모든 하위 폴더의 .tex 파일을 찾아서 루프 돌리기
find . -name "*.tex" | while read -r tex_file; do
    [ -e "$tex_file" ] || continue

    target_dir=$(dirname "$tex_file")
    file_name=$(basename "$tex_file")
    base_name="${file_name%.tex}" # 확장자를 뗀 순수 파일명 (예: bandits)

    echo "=================================================="
    echo "Processing: $file_name"
    echo "Directory : $target_dir"
    echo "=================================================="

    # 1. 해당 디렉토리 위치에 컴파일 결과물 생성
    latexmk -pdf -interaction=nonstopmode \
            -output-directory="$target_dir" \
            "$tex_file"

    # 2. 강제 셸 청소 루틴 (C++의 rm -f object 파일과 동일)
    # PDF를 제외한 .aux, .log, .fls, .fdb_latexmk, .synctex.gz 등 쓰레기 파일 싹 정리
    echo "Cleaning auxiliary files in $target_dir..."
    rm -f "$target_dir/$base_name.aux" \
          "$target_dir/$base_name.log" \
          "$target_dir/$base_name.fls" \
          "$target_dir/$base_name.fdb_latexmk" \
          "$target_dir/$base_name.out" \
          "$target_dir/$base_name.toc" \
          "$target_dir/$base_name.bbl" \
          "$target_dir/$base_name.blg"
done

echo "=================================================="
echo "Done! Clean PDFs are generated in their respective directories."