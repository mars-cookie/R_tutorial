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


play.hangman <- function() {
  # 변수 사전을 정의해 보세요.
  number.mistakes <-  # 문제 2. 틀린 횟수는 초기에 몇 번이 되어야 할까요?
  hangman.word <- "korea"
  splt.word <- strsplit(hangman.word, '')[[1]]
  used.letters <- c()
  n <- str_length(hangman.word) #stringr 패키지에 있는 함수
  player <- rep('_', n)
  
  # 먼저, 단어를 추측할 때마다 number.mistakes를 확인해야 합니다.
  
  while (#문제3. 조건)  { # 문제3. 실수가 6번까지 허용됩니다. 어떤 조건을 사용해야 할까요?
    cat(player, sep = '')  # 먼저 답안지를 출력.
    letter <- # 문제 4. 사용자가 추측하도록 유도하는 메시지를 작성해 보세요. HINT. 데이터 입력!
    while(toupper(letter) %in% LETTERS){
      letter <- readline("영어 알파벳으로 추측해보세요.: ") # 자료 유형에 오류가 있을 때
    }
    while(toupper(letter) %in% used.letters) {  # 이미 사용했던 알파벳이라면? 어떤 제어문을 사용할까요?
      guess.messages <- cat(paste("이미 사용된 알파벳입니다.", touper(used.letters)))  # 5. 사용자에게 알려주세요!
      letter <- readline(paste(guess.messages, '다른 알파벳으로 추측해보세요: '))
    }
    
    # 1. 'a'를 korea라는 문자열에서 검색
    # 2. a를 c('k', 'o', 'r', 'e', 'a')라는 문자열 벡터에서 검색
    
    if(letter %in% split.word) {  # 6. 알파벳이 답이라면? 어떤 제어문을 쓸까요?
      logic.v <- split.word == letter # 논리형
      player[logical.v] <- letter
      word.display <- paste(player, sep = "")  # 맞힌 자리에 알파벳을 채워서 답안지를 보여주기
    } else {
      # 문제 5. 추측이 틀렸다면! number.mistakes에는 어떤 변화가 있을까요?
      number.mistakes <- number.mistakes + 1
      # 문제 6. 플레이어에게 몇 번의 기회가 남았는지 알려줘야 합니다.
      # HINT! 정수와 문자를 동시에 출력할 수 있는 cat( ) 문을 사용해봅시다.
    }
    used.letters <-c(used.letters, toupper(letter))  # 지금까지 사용된 알파벳의 정보를 저장합니다.
  }
  if(!'_' %in% player) {
    cat('승리!')
    break
  }
  if(#문제7 빈칸)  { # 문제7. 만약 실수가 7번 이상이라면?
    # 문제8. guess.messages에 game over message를 작성해봅시다.
    cat(guess.messages)
    break
  }
}

play.hangman()