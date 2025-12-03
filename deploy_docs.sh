#!/usr/bin/env bash
set -e  # 중간에 에러 나면 바로 종료

# Git repo 루트 디렉토리 이름 = GitHub 레포 이름이라고 가정
REPO_NAME=$(basename "$(git rev-parse --show-toplevel)")

# 커밋 메시지는 인자로 받되, 없으면 기본값 사용
COMMIT_MSG=${1:-"chore: deploy docs"}

echo "📦 Repo name: $REPO_NAME"
echo "🛠  Building Flutter web with base href '/$REPO_NAME/' ..."

# 1) Flutter 웹 빌드
flutter clean
flutter build web --release --base-href "/$REPO_NAME/"

# 2) docs 폴더 초기화 후 build/web 복사
echo "🧹 Cleaning docs/ and copying build/web -> docs/ ..."
rm -rf docs
mkdir docs
cp -R build/web/* docs/

# 3) git add + commit + push
echo "📚 Staging docs/ ..."
git add docs

# 변경사항 없으면 커밋 스킵
if git diff --cached --quiet; then
  echo "✅ 변경된 docs 내용이 없어서 커밋/푸시는 생략할게."
  exit 0
fi

echo "📝 Committing: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to origin ..."
git push

echo "🎉 Done! GitHub Pages가 /docs 기준으로 잘 붙어 있으면 곧 반영될 거야."
