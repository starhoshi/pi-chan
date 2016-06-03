import Quick
import Nimble
@testable import pi_chan

class KeychainManagerSpec: QuickSpec {
  override func spec() {
    beforeEach {
      KeychainManager.setToken("")
      KeychainManager.setTeamName("")
    }
    describe("initialSettings") {
      it("blank Token, TeamName") {
        KeychainManager.initialSettings()
        expect(KeychainManager.getToken()).to(equal(""))
        expect(KeychainManager.getTeamName()).to(equal(""))
      }
    }
    describe("clear") {
      it("blank Token, TeamName") {
        KeychainManager.setToken("aaaaaaaa")
        KeychainManager.setTeamName("bbbbbbbb")
        KeychainManager.clear()
        expect(KeychainManager.getToken()).to(equal(""))
        expect(KeychainManager.getTeamName()).to(equal(""))
      }
    }
    describe("set, get") {
      it("setToken, setTeamName, getToken, getTeamName") {
        let token = "token"
        let teamName = "team"
        KeychainManager.setToken(token)
        KeychainManager.setTeamName(teamName)
        expect(KeychainManager.getToken()).to(equal(token))
        expect(KeychainManager.getTeamName()).to(equal(teamName))
      }
    }
  }
}
