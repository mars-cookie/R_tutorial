# 간단한 hangman game을 만들며 제어문(control statement)의 개념들을 하나씩 익혀봅시다.
# 행맨게임은 주어진 문제에 대해 영어 알파벳을 하나씩 추측하며정답을 맞히는 게임입니다.
# 오답을 6번을 넘기지 않으면서 정답을 맞춰 철자를 맞혀야 합니다.

# 다음 조건들을 생각해봅시다.
#   1. 7번 틀리면 플에이어의 패배, 그 전에 정답을 맞히면 플레이어의 승리!
#   2. 추측은 영어 알파벳으로만.
#   3. 한번 틀린 알파벳은 다시 사용하지 않도록.

# variable dictionary (변수 사전) -----------------------

# number.mistakes:  누적 실수 횟수
# player:           플레이어의 답안지  # e.g. _ _ a _ _ _
# hangman.word:     정답 단어
# letter:           사용자가 추측한 알파벳
# used.letters:     이미 사용된 알파벳

# 문제 1. 사용자의 데이터 입력 -------------------------------------
# HINT: readline 함수! 이곳에 주석을 지우고 답을 작성해주세요.

library(stringr)

play.hangman <- function() {
  # 변수 사전을 정의해 보세요.
  number.mistakes <- 0  # 문제 2. 틀린 횟수는 초기에 0번이 되어야 합니다.
  hangman.word <- "korea"
  split.word <- strsplit(hangman.word, '')[[1]] # 문자열 자르는 함수. 구분자가 없으니 한 글자씩 자름.
  used.letters <- c()
  n <- str_length(hangman.word) #stringr 패키지에 있는 함수. 문자의 길이 확인
  player <- rep('_', n)
  
  # 먼저, 단어를 추측할 때마다 number.mistakes를 확인해야 합니다.
  
  while (number.mistakes < 6)  { # 문제3. 실수가 6번까지 허용됩니다.
    cat(player, sep = '')  # 먼저 답안지를 출력.
    letter <- readline("알파벳을 추측해보세요: ") # 문제 4. 사용자가 추측하도록 유도하는 메시지
    # toupper : 대문자로 변환
    while(!(toupper(letter) %in% LETTERS)){ # LETTERS는 대문자 알파벳을 나타내는 내장상수
      letter <- readline("영어 알파벳으로 추측해보세요.: ") # 자료 유형에 오류가 있을 때
    }
    while(toupper(letter) %in% used.letters) {  # 이미 사용했던 알파벳이라면
      guess.messages <- paste("이미 사용된 알파벳입니다.", toupper(letter))  # 5. 사용자에게 알려주세요!
      letter <- readline(paste(guess.messages, "\n",'다른 알파벳으로 추측해보세요: '))
    }
    
    if(letter %in% split.word) {  # 6. 알파벳이 답이라면
      logic.v <- split.word == letter # 논리형
      player[logic.v] <- letter
      word.display <- paste(player, collapse = "")  # 맞힌 자리에 알파벳을 채워서 답안지를 보여주기
    } else {
      # 문제 5. 추측이 틀렸다면 number.mistakes를 1 증가시킵니다.
      number.mistakes <- number.mistakes + 1
      # 문제 6. 플레이어에게 몇 번의 기회가 남았는지 알려줍니다.
      cat("틀렸습니다! 남은 기회:", 6 - number.mistakes, "\n")
    }
    used.letters <- c(used.letters, toupper(letter))  # 지금까지 사용된 알파벳의 정보를 저장합니다.
    
    if(!'_' %in% player) { # _ 표시가 아예 없다면
      cat('승리!\n')
      break
    }
  }
  if(number.mistakes >= 6)  { # 문제7. 만약 실수가 6번 이상이라면
    # 문제8. guess.messages에 game over message를 작성합니다.
    guess.messages <- "Game Over! 정답은 다음과 같습니다: "
    cat(guess.messages, hangman.word, "\n")
  }
}

play.hangman()
