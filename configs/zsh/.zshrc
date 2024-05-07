# Add git branch to the prompt.
function parse_git_branch() {
  if BRANCH="$(git symbolic-ref --quiet --short HEAD 2>/dev/null)"; then
    echo "[${BRANCH}] "
  elif HASH="$(git rev-parse --verify --quiet --short HEAD 2>/dev/null)"; then
    echo "[(HEAD detached at ${HASH})] "
  fi
}

function prompt() {
  # man zshmisc
  FG_COLOR_GRAY="%F{243}"
  FG_COLOR_WARM_PINK="%F{197}"
  FG_COLOR_CRYSTAL_BLUE="%F{39}"
  FG_COLOR_RESET="%f"

  USER="${FG_COLOR_GRAY}%n"
  DIR="${FG_COLOR_WARM_PINK}%~"
  GIT_BRANCH="${FG_COLOR_CRYSTAL_BLUE}$(parse_git_branch)"

  echo "${USER} ${DIR} ${GIT_BRANCH}${FG_COLOR_RESET}$ "
}

setopt PROMPT_SUBST
export PROMPT='$(prompt)'


# Load Git completion.
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit


# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
